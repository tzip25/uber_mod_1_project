def show_rides
  puts "Ride Menu:"
  puts "1. View by route"
  puts "2. View by ride type"
  puts "3. Favorite rides"
  puts "4. Go back to Main menu"

  user_input = get_user_input.to_i
  system "clear"
  puts "\e[H\e[2J"

  if user_input == 1
    #run view by routes
    select_route
  elsif user_input == 2
    #run ride_by_type
    run_ride_by_type
  elsif user_input == 3
    #Bring up list of favorites
    favorite_rides
  elsif user_input == 4
   welcome
  else
    #error handling
    puts "Please enter a valid option between 1 and 4:"
    puts "\n"
    show_rides
  end
end
