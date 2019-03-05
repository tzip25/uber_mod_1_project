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
  EndLocation.find_or_create_by(name: start_address, lat: results.first.coordinates[0], long: results.first.coordinates[1])

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
  StartLocation.find_or_create_by(name: end_address, lat: results.first.coordinates[0], long: results.first.coordinates[1])
  EndLocation.find_or_create_by(name: end_address, lat: results.first.coordinates[0], long: results.first.coordinates[1])
  puts "Ride will end at #{end_address}"
end
