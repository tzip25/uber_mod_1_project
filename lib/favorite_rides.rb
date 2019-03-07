def self.favorite_rides
  favorite_rides_menu_array = [:add_favorite_ride, :remove_favorite_rides, :view_favorite_rides, :view_rides_menu]
  if get_favorite_rides_array.empty?
     #do an empty favorite_rides
     puts "You don't have any Favorites! Why don't you add one?"
     puts "\n"
     application_builder("Favorite Rides", favorite_rides_menu_array)
  else
    application_builder("Favorite Rides", favorite_rides_menu_array)
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
  favorite_rides
end

def add_favorite_ride
  system "clear"
  puts "\e[H\e[2J"
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
    puts "Ride added to favorites!"
  end
  favorite_rides
end

def remove_favorite_rides
  system "clear"
  puts "\e[H\e[2J"
  if get_uniq_rides.empty?
    puts "You don't have any rides yet!"
    puts "\n"
    main_menu
  else
  #delete a rides from favorites
  show_favorites_end
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
      puts "Ride removed from favorites!"
    end
  end

    show_favorites_end
        favorite_rides
end

def show_favorites_end
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
  def run_favorite_rides
    view_favorite_rides
  end
