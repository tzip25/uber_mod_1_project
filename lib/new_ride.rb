def new_ride_menu

end

def get_start_address
  #Gets user's address to start uber ride
  puts "Please enter the exact start address with a zip code:"
  start_address = gets.chomp.to_s

  #Translates address into lat/long
  results = Geocoder.search(start_address)
  puts results.first.inspect
  results.first.coordinates

  #Persist start location in start and end location tables to maintain integrity
  StartLocation.find_or_create_by(name: start_address, lat: results.first.coordinates[0], long: results.first.coordinates[1])

  puts "Ride will start from #{start_address}"
end


def get_end_address
  #Gets user's address to start uber ride
  puts "Please enter the exact end address with a zip code:"
  end_address = gets.chomp.to_s

  #Translates address into lat/long
  results = Geocoder.search(end_address)
  puts results.first.inspect
  results.first.coordinates

  #Persist end location in end and end location tables to maintain integrity
  EndLocation.find_or_create_by(name: end_address, lat: results.first.coordinates[0], long: results.first.coordinates[1])
  puts "Ride will end at #{end_address}"
end

def persist_ride
    get_uber_api["prices"].each do |ride|
    Ride.find_or_create_by(name: "#{StartLocation.last.name} to #{EndLocation.last.name}", start_location_id:StartLocation.last.id, end_location_id:EndLocation.last.id, product_type: ride["display_name"], estimate: ride["estimate"], high_estimate: ride["high_estimate"], low_estimate: ride["low_estimate"], distance: ride["distance"], duration: ride["duration"])
    puts "#{ride["display_name"]}: #{ride["estimate"]}"  
    end
    puts "↑ Check out those sweet ride options!"
end

def create_runner
  get_start_address
  get_end_address
  get_uber_api
  persist_ride
end
