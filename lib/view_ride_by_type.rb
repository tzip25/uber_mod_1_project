def pick_type
#To get view ride by type to work, we need to pass through the types from the selection.
#Create an array seperated by a comma and "developerize? Those will be based on the method names... so instead need to write a new method
#for each different set of arguments.. sound slike a macro"
#avorite_rides_menu_array = [:add_favorite_ride, :remove_favorite_rides, :show_rides]
#application_builder("Favorite Rides", favorite_rides_menu_array)
  puts "Ride Types"
  puts "1. UberX/Lyft"
  puts "2. UberXL/Lyft Plus"
  puts "3. Uber Black/Lyft Lux"
  puts "4. Uber Black SUV/Lyft Lux SUV"
  puts "5. Uber Pool/Lyft Line" #maybe make this just lyft... or remove it
  puts "6. Go back to Main Menu"
  puts "\nPlease enter your selection:"
  user_input =  get_user_input.to_i
  #title page------
  title
  #end title page----

  if Ride.all.empty?
    puts "You don't have any rides yet!"
    puts "\n"
    main_menu
  else
    #title page------
    title
    #end title page----

  if user_input == 1
    ride_date_by_type("UberX", "lyft")
  elsif user_input == 2
    ride_date_by_type("UberXL", "lyft_plus")
  elsif user_input == 3
    ride_date_by_type("Black", "lyft_lux")
  elsif user_input == 4
    ride_date_by_type("Black SUV", "lyft_luxsuv")
  elsif user_input == 5
    ride_date_by_type("Pool", "lyft_line")
  elsif user_input == 6
    main_menu
  else
    #add error handling
    puts "\n****Error: Please enter a valid number****"
    puts "\n"
    pick_type
  end
end
end

def ride_date_by_type(uber, lyft)
  puts "Ride type selected: #{uber}/#{lyft} \n"
  uber_rides_arr = Ride.where(product_type: "#{uber}")
  lyft_rides_arr = Ride.where(product_type: "#{lyft}")
  rides_arr = (uber_rides_arr + lyft_rides_arr).sort_by {|ride| ride.name}
  rides_arr.each do |ride|
    puts "#{ride.name.ljust(50)} | #{ride.product_type.ljust(12)} | #{ride.estimate.ljust(12)} | #{ride.created_at}"
  end
end


def view_rides_by_type
  pick_type
  puts "\n"
  ride_menu
end
