def welcome
  puts "Main Menu"
  puts "1. Start a new ride"
  puts "2. Find previous rides"
  puts "3. View my locations"
  puts "4. Exit"
  puts "\nPlease enter your selection:"
  get_user_input =  gets.chomp.to_i
  system "clear"
  puts "\e[H\e[2J"

  #loop menu until exit is selected
  while get_user_input != "exit"
    if get_user_input == 1
      #run new_ride.rb methods
      new_ride_menu
    elsif get_user_input == 2
      #go to antoher sub-menu - will include Ride.all
      show_rides
    elsif get_user_input == 3
      #go to antoher sub-menu - will include Locations from one table, make sure this has option to delete
      view_locations
    elsif get_user_input == 4
      #exits program
      exit
    else
      #returns error message if not integer 1-4, allows you to enter again
      puts "Please enter a valid option between 1 and 4:"
      puts "Main Menu"
      puts "1. Start a new ride"
      puts "2. Find previous rides"
      puts "3. View my locations"
      puts "4. Exit"
      get_user_input =  gets.chomp.to_i
    end
  end
  #for some reason this doesn't actually exit
  exit
end
