
def new_ride_menu
puts "New Ride Menu"
puts "1. Enter a new address"
puts "2. See a list of previous addresses to choose from"
puts "3. Go back to main menu"
user_selection = gets.chomp.to_i
#use below to "clear" terminal windown before proceeding
system "clear"
puts "\e[H\e[2J"

  if user_selection == 1
    #run new_ride_menu using runner method
    run_new_ride
  elsif user_selection == 2
    puts "Choose from the locations below."
    #get list of addresses from database
    view_all_locations
    #TODO update number validations for this
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
  user_start_address = gets.chomp.to_s
  #Translates address into lat/long
  results = Geocoder.search(user_start_address)
  # binding.pry
  #check if address returns a NoMethodErro (i.e. address is not valid)
  if results.empty?
    puts "That is not a valid address."
    get_start_address

  else
    results.first.coordinates
    #Persist start location in start and end location tables to maintain integrity
    new_start_location = StartLocation.find_or_create_by(name: user_start_address, lat: results.first.coordinates[0], long: results.first.coordinates[1])

    puts "Ride will start from #{new_start_location.name}"
    new_start_location
  end
end


def get_end_address
  #Gets user's address to start uber ride
  puts "\nPlease enter the exact end address with a zip code:"
  user_end_address = gets.chomp.to_s

  #Translates address into lat/long
  results = Geocoder.search(user_end_address)
  results.first.coordinates

  #Persist end location in end and end location tables to maintain integrity
  new_end_location = EndLocation.find_or_create_by(name: user_end_address, lat: results.first.coordinates[0], long: results.first.coordinates[1])
  puts "Ride will end at #{new_end_location.name}"
  new_end_location
end

def persist_ride(api_response, start_address, end_address)
    puts "\n↓ Check out these sweet ride options!"
    api_response["prices"].each do |ride|
    Ride.find_or_create_by(name: "#{start_address.name} to #{end_address.name}", start_location_id: start_address.id, end_location_id: end_address.id, product_type: ride["display_name"], estimate: ride["estimate"], high_estimate: ride["high_estimate"], low_estimate: ride["low_estimate"], distance: ride["distance"], duration: ride["duration"])
    # puts "Data for ride from #{start_address.name} to #{end_address.name}"
    puts "#{ride["display_name"]}: #{ride["estimate"]}"
    end
    puts "-----------------------------------"
end

def run_new_ride
    start_address = get_start_address
    end_address = get_end_address
    api_response = get_uber_api(start_address, end_address)
    persist_ride(api_response, start_address, end_address)
    new_ride_menu
end
