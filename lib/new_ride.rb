def new_ride_menu

puts "1. Enter a new address"
puts "2. See a list of previous address to choose from"
puts "3. Go back to main menu"
user_selection = gets.chomp.to_i

  if user_selection == 1
    #run new_ride_menu using runner method
    run_new_ride
  elsif user_selection == 2
    #get list of addresses from database
    StartLocation.all.each_with_index do |start_location, i|
      if i < 5
        puts "#{i+1}: #{start_location.name}"
      end
    end
    EndLocation.all.each_with_index do |end_location, i|
      if i < 5
        puts "#{i+1}: #{end_location.name}"
      end
    end
    "Choose from the locations above."
    run_new_ride
  elsif user_selection == 3
    welcome
  else
    puts "Dude! That's not 1, 2, or 3!"
    new_ride_menu
    end
end


def get_start_address
  #Gets user's address to start uber ride
  puts "Please enter the exact start address with a zip code:"
  start_address = gets.chomp.to_s

  #Translates address into lat/long
  results = Geocoder.search(start_address)
  results.first.coordinates

  #Persist start location in start and end location tables to maintain integrity
  new_start_location = StartLocation.find_or_create_by(name: start_address, lat: results.first.coordinates[0], long: results.first.coordinates[1])

  "Ride will start from #{new_start_location.name}"
end


def get_end_address
  #Gets user's address to start uber ride
  puts "Please enter the exact end address with a zip code:"
  end_address = gets.chomp.to_s

  #Translates address into lat/long
  results = Geocoder.search(end_address)
  results.first.coordinates

  #Persist end location in end and end location tables to maintain integrity
  EndLocation.find_or_create_by(name: end_address, lat: results.first.coordinates[0], long: results.first.coordinates[1])
  "Ride will end at #{end_address}"
end

def persist_ride
    get_uber_api["prices"].each do |ride|
    Ride.find_or_create_by(name: "#{StartLocation.last.name} to #{EndLocation.last.name}", start_location_id:StartLocation.last.id, end_location_id:EndLocation.last.id, product_type: ride["display_name"], estimate: ride["estimate"], high_estimate: ride["high_estimate"], low_estimate: ride["low_estimate"], distance: ride["distance"], duration: ride["duration"])
    puts "#{ride["display_name"]}: #{ride["estimate"]}"
    end
    puts "↑ Check out those sweet ride options!"
end

def run_new_ride
    get_start_address
    get_end_address
    get_uber_api
    persist_ride
    new_ride_menu
end
