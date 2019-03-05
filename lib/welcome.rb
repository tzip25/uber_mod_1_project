
def welcome
  "Welcome to our sweet ride app!"
  if get_user_input == 1
    "1. Start a new ride"
    #run new_ride.rb methods
  elsif get_user_input == 2
    "2. Find previous rides"
    #go to antoher sub-menu - will include Ride.all
  elsif get_user_input == 3
    "3. View my locations"
    #go to antoher sub-menu - will include Locations from one table
  elsif get_user_input == 4
    "4. Exit"
    #exits program
  else
    "Please enter a valid option"
  end
end

def get_user_input
  gets.chomp.downcase
end
