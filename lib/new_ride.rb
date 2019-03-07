
#Builds new ride menu and application interaction functionality
##New ride menu options include entering a new ride, running a new ride from a list of previous locaitons, and going back to the main menu
def self.new_ride_menu
  new_ride_menu_array = [:run_new_ride, :select_from_previous_locations, :main_menu]
  application_builder("New Ride Menu", new_ride_menu_array)
end


def get_start_address
  #Gets user's address to start uber ride
  puts "\nPlease enter your START address:"
  user_start_address = get_user_input
  #Translates address into lat/long
  results = Geocoder.search(user_start_address)

  if results.empty? #check if address returns empty array (i.e. address is invalid)
    puts "That is not a valid address."
    get_start_address

  else
    results.first.coordinates
    #Persist end location in end table to maintain integrity/reduce duplicates
    StartLocation.find_or_create_by(lat: results.first.coordinates[0], long: results.first.coordinates[1])
    StartLocation.where(lat: results.first.coordinates[0], long: results.first.coordinates[1]).update(name: user_start_address)
    #Persist start location in start table to maintain integrity/reduce duplicates
    StartLocation.find_or_create_by(lat: results.first.coordinates[0], long: results.first.coordinates[1])
    StartLocation.where(lat: results.first.coordinates[0], long: results.first.coordinates[1]).update(name: user_start_address)
    new_start_location = StartLocation.where(lat: results.first.coordinates[0], long: results.first.coordinates[1]).first

    #I think this is blank because it uses the name of the new datapoint without an updated name.
    new_start_location
  end
end

def get_end_address
  #Gets user's end address for ride
  puts "\nPlease enter your END address:"
  user_end_address = get_user_input
  #Translates address into lat/long
  results = Geocoder.search(user_end_address)

  if results.empty? #check if address returns empty array (i.e. address is invalid)
    puts "That is not a valid address."
    get_end_address

  else
    results.first.coordinates
    #Persist end location in end table to maintain integrity/reduce duplicates
    EndLocation.find_or_create_by(lat: results.first.coordinates[0], long: results.first.coordinates[1])
    EndLocation.where(lat: results.first.coordinates[0], long: results.first.coordinates[1]).update(name: user_end_address)
    #Persist start location in start table to maintain integrity/reduce duplicates
    StartLocation.find_or_create_by(lat: results.first.coordinates[0], long: results.first.coordinates[1])
    StartLocation.where(lat: results.first.coordinates[0], long: results.first.coordinates[1]).update(name: user_end_address)
    new_end_location = EndLocation.where(lat: results.first.coordinates[0], long: results.first.coordinates[1]).first

    #I think this is blank because it uses the name of the new datapoint without an updated name.
    new_end_location
  end
end

def persist_ride(api_response, start_address, end_address)
    ride_name = "#{start_address.name} to #{end_address.name}"
    puts "\n↓ Check out these sweet Uber options!"
    api_response["prices"].each do |ride|
    #persist ride in database
    Ride.find_or_create_by(name: ride_name, start_location_id: start_address.id, end_location_id: end_address.id, product_type: ride["display_name"], estimate: ride["estimate"], high_estimate: ride["high_estimate"], low_estimate: ride["low_estimate"], distance: ride["distance"], duration: ride["duration"])
    # puts "Data for ride from #{start_address.name} to #{end_address.name}"
    puts "#{ride["display_name"]}: #{ride["estimate"]}"
    end
    puts "------------------------------------------"
end

def persist_lyft_ride(lyft_api_response, start_address, end_address)
    puts "\n↓ Check out these sweet Lyft options!"
    lyft_api_response["cost_estimates"].each do |ride|
      #convert min and max price estimates to dollars
      min_price_dollars = (ride["estimated_cost_cents_min"].to_f / 100)
      max_price_dollars = (ride["estimated_cost_cents_max"].to_f / 100)
      #create estimate string from min and max prices
      price_estimate = "$#{min_price_dollars}-#{max_price_dollars}"
      #persist ride in database
      Ride.find_or_create_by(name: "#{start_address.name} to #{end_address.name}", start_location_id: start_address.id, end_location_id: end_address.id, product_type: ride["ride_type"], estimate: price_estimate, high_estimate: max_price_dollars, low_estimate: min_price_dollars, distance: ride["estimated_distance_miles"], duration: ride["estimated_duration_seconds"])

      # puts "Data for ride from #{start_address.name} to #{end_address.name}"
      puts "#{ride["ride_type"]}: #{price_estimate}"
    end
    puts "------------------------------------------"
end


def select_from_previous_locations
  print_all_locations
  run_new_ride
end

def self.run_new_ride #had self.
    start_address = get_start_address
    end_address = get_end_address

    #run and persist uber rides and output results
    api_response = get_uber_api(start_address, end_address)
    persist_ride(api_response, start_address, end_address)

    #run and persist lyft rides and output results
    lyft_api_response = run_lyft_api(start_address, end_address)
    persist_lyft_ride(lyft_api_response, start_address, end_address)
    new_ride_menu
end
