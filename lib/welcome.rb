def get_user_input
  #loop until exit is entered
  user_input = gets.chomp
  user_input == "exit" ? exit : user_input
end

def welcome
  puts "Main Menu"
  puts "1. Start a new ride"
  puts "2. Ride History"
  puts "3. Location History"
  puts "4. Type 'exit' at any time to exit the program."
  puts "\nPlease enter your selection:"
  user_input = get_user_input.to_i
  system "clear"
  puts "\e[H\e[2J"

    if user_input == 1
      #run new_ride.rb methods
      new_ride_menu
    elsif user_input == 2
      #go to antoher sub-menu - will include Ride.all
      show_rides
    elsif user_input == 3
      #go to antoher sub-menu - will include Locations from one table, make sure this has option to delete
      view_locations
    elsif user_input == 4
      #exits the program
      exit
    else
      #returns error message if not integer 1-4, allows you to enter again
      puts "Please enter a valid option between 1 and 4:"
      puts "\n"
      welcome
    end
end
