

def get_uniq_rides
  Ride.all.map { |ride| ride.name}.uniq
end

def view_all_rides
  get_uniq_rides.each_with_index { |ride, i| puts "#{i+1}: #{ride}" }
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
    
  else
    puts "Favorite rides:"
    get_favorite_rides_array.each_with_index { |ride, i| puts "#{i+1}. #{ride}" }
    puts "\n"
  end
  
end

def add_favorite_ride
  #title page------
  title
  #end title page----

  if get_uniq_rides.empty?
    puts "You don't have any rides yet!"
    puts "\n"
    
  else
    view_all_rides
    puts "\n"
    puts "Please enter the ride number you want to add to favorites:"
    #get favorite ride name
    favorite_ride_number = get_user_input.to_i
    #title page------
    title
    #end title page----
  end

  if favorite_ride_number == 0 || favorite_ride_number > get_uniq_rides.length
    puts "Please enter a number between 1 and #{get_uniq_rides.length}"
    add_favorite_ride
  else
    ride_name = get_uniq_rides[favorite_ride_number-1]
    #update start and end ride in database with favorite
    Ride.where(name: ride_name).update(favorite: true)
    puts "Ride added to favorites!"
    puts "\n"
  end
  show_favorites_end
  
end

def remove_favorite_rides
  #title page------
  title
  #end title page----

  if get_uniq_rides.empty?
    puts "You don't have any rides yet!"
    puts "\n"
    
  else
  #delete a rides from favorites
  show_favorites_end
    puts "\n"
    puts "Please enter the rides number you want to remove from Favorites:"
    #get favorite rides name
    favorite_to_remove = get_user_input.to_i
    #title page------
    title
    #end title page----

    if favorite_to_remove == 0 || favorite_to_remove > get_favorite_rides_array.length
      puts "Please enter a number between 1 and #{get_favorite_rides_array.length}"
      remove_favorite_rides
    else
      rides_name = get_favorite_rides_array[favorite_to_remove-1]
      #update start and end rides in database with favorite
      Ride.where(name: rides_name).update(favorite: false)
      puts "Ride removed from favorites!"
      puts "\n"
    end
  end

    show_favorites_end
    
end

def show_favorites_end
          if get_favorite_rides_array.empty?
          puts "You don't have any Favorites! Why don't you add one?"
          puts "\n"
          
        else
          puts "Favorite rides:"
          get_favorite_rides_array.each_with_index do |ride, i|
            puts "#{i+1}. #{ride}"
          end
          puts "\n"
        end
end

  def run_favorite_rides
    view_favorite_rides
  end
