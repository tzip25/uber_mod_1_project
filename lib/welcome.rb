
def welcome
  puts "Welcome to our sweet ride app!"
  puts "1. Start a new ride"
  puts "2. Find previous rides"
  puts "3. View my locations"
  puts "4. Exit"
  get_user_input =  gets.chomp.to_i

  if get_user_input == 1
    #run new_ride.rb methods
    new_ride_menu
  elsif get_user_input == 2
    #go to antoher sub-menu - will include Ride.all
  elsif get_user_input == 3
    #go to antoher sub-menu - will include Locations from one table, make sure this has option to delete
  elsif get_user_input == 4
    #exits program
  else
    "Please enter a valid option"
  end
end
