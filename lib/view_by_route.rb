
def view_by_route
    if get_uniq_rides.empty?
    puts "You don't have any rides yet!"
    puts "\n"
    main_menu
    else
    view_all_rides
    puts "\nPlease select a route from above:"
    user_input = get_user_input.to_i
    #title page------
    title
    #end title page----

    ride_name = view_all_rides[user_input-1]
    array_length = view_all_rides.length

    if user_input == 0 || user_input > array_length
      #title page------
      title
      #end title page----

      puts "Please enter a number between 1 and #{array_length}"
      puts "\n"
      select_route
    else
      rides = Ride.where(name: ride_name)
      #title page------
      title
      #end title page----

      puts "Route: #{ride_name}"
      rides.each { |ride| puts "#{ride.product_type}: #{ride.estimate}" }
      puts "\n"
      ride_menu
    end
  end
end
