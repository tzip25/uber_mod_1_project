  def view_routes
    #TODO add conditional for no routes
    #will give a unique list of ride names
    #will return all the rides with the name of selected ride
    rides_arr = Ride.all.map { |ride| ride.name }.uniq
    rides_arr.each_with_index { |ride, i| puts "#{i+1}: #{ride}" }
    rides_arr
  end

  def select_route
    if view_by_route.empty?
    puts "You don't have any rides yet!"
    puts "\n"
    main_menu
    else

    puts "\nPlease select a route from above:"
    user_input = gets.chomp.to_i
    system "clear"
    puts "\e[H\e[2J"

    ride_name = view_by_route[user_input-1]
    array_length = view_by_route.length

    if user_input == 0 || user_input > array_length
      system "clear"
      puts "\e[H\e[2J"
      puts "Please enter a number between 1 and #{array_length}"
      puts "\n"
      select_route
    else
      rides = Ride.where(name: ride_name)
      system "clear"
      puts "\e[H\e[2J"
      puts "Route: #{ride_name}"
      rides.each do |ride|
        puts "#{ride.product_type}: #{ride.estimate}"
      end
    end
  end
end

def view_by_route
  view_routes
  puts "\n"
  select_route
  puts "\n"
end
