def favorite_rides
  if get_favorite_rides_array.empty?
    puts "You don't have any Favorites! Why don't you add one?"
    puts "\n"
    puts "Favorite Ride Menu"
    puts "1. Add a ride to Favorites"
    puts "2. Remove a ride from Favorites"
    puts "3. Go back to previous menu"
    user_input = gets.chomp.to_i
    system "clear"
    puts "\e[H\e[2J"

    if user_input == 1
      add_favorite_ride
    elsif user_input == 2
      remove_favorite_rides
    elsif user_input == 3
      show_rides
    else
      puts "*Error: Please select an option from the Favorite Ride Menu below:*"
      puts "\n"
      favorite_rides
    end
      puts "\n"
      favorite_rides
  else
  view_favorite_rides
  puts "\n"
  puts "Favorite Ride Menu"
  puts "1. Add a ride to Favorites"
  puts "2. Remove a ride from Favorites"
  puts "3. Go back to rides menu"
  user_input = gets.chomp.to_i
  system "clear"
  puts "\e[H\e[2J"

  if user_input == 1
    add_favorite_ride
  elsif user_input == 2
    remove_favorite_rides
  elsif user_input == 3
    show_rides
  else
    puts "*Error: Please select an option from the Favorite Ride Menu below:*"
    puts "\n"
    favorite_rides
  end
    puts "\n"
    favorite_rides
  end
end


def get_uniq_rides
  Ride.all.map do |ride|
    ride.name
  end.uniq
end

def view_all_rides
  get_uniq_rides.each_with_index do |ride, i|
      puts "#{i+1}: #{ride}"
  end
end

# def view_recent_rides
#   get_uniq_rides.each_with_index do |ride, i|
#     if i < 3
#       puts "#{i+1}. #{ride}"
#     end
#   end
# end

def get_favorite_rides_array
  Ride.all.select do |ride|
    ride.favorite == true
  end.map {|ride| ride.name }.uniq
end

def view_favorite_rides
  if get_favorite_rides_array.empty?
    puts "You don't have any Favorites! Why don't you add one?"
    puts "\n"
    favorite_rides
  else
    puts "Favorite rides:"
    get_favorite_rides_array.each_with_index do |ride, i|
      puts "#{i+1}. #{ride}"
    end
  end
end

def add_favorite_ride
  #add a ride to favorites
  if get_uniq_rides.empty?
    puts "You don't have any rides yet!"
    puts "\n"
    main_menu
  else
    view_all_rides
    puts "\n"
    puts "Please enter the ride number you want to add to favorites:"
    #get favorite ride name
    favorite_ride_number = gets.chomp.to_i
    system "clear"
    puts "\e[H\e[2J"
  end

  if favorite_ride_number == 0 || favorite_ride_number > get_uniq_rides.length
    puts "Please enter a number between 1 and #{get_uniq_rides.length}"
    add_favorite_ride
  else
    ride_name = get_uniq_rides[favorite_ride_number-1]
    #update start and end ride in database with favorite
    Ride.where(name: ride_name).update(favorite: true)
  end
end

def remove_favorite_rides
  if get_uniq_rides.empty?
    puts "You don't have any rides yet!"
    puts "\n"
    main_menu
  else
  #delete a rides from favorites
    view_favorite_rides
    puts "\n"
    puts "Please enter the rides number you want to remove from Favorites:"
    #get favorite rides name
    favorite_to_remove = gets.chomp.to_i
    system "clear"
    puts "\e[H\e[2J"

    if favorite_to_remove == 0 || favorite_to_remove > get_favorite_rides_array.length
      puts "Please enter a number between 1 and #{get_favorite_rides_array.length}"
      remove_favorite_rides
    else
      rides_name = get_favorite_rides_array[favorite_to_remove-1]
      #update start and end rides in database with favorite
      Ride.where(name: rides_name).update(favorite: false)
    end
  end
end

  def run_favorite_rides
    view_favorite_rides
  end
