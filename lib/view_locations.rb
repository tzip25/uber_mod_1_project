def self.view_locations


  view_locations_array = [:view_recent_locations, :view_all_locations, :delete_location, :view_favorite_locations, :add_favorite_location, :remove_favorite_location, :main_menu]
  application_builder("View Locations", view_locations_array)
end

def get_uniq_locations
  start_array = StartLocation.all.map do |start_location|
    start_location.name
  end
  EndLocation.all.each do |end_location|
    start_array << end_location.name
  end
  uniq_arr = start_array.uniq
  uniq_arr
end

def view_all_locations
  print_all_locations
  puts "\n"
  view_locations
end

def view_recent_locations
  if get_uniq_locations.empty?
    puts "You don't have any locations yet! Start a new ride to add a location."
    puts "\n"
    main_menu
  else
    puts "Your three most recent locations are:"
    get_uniq_locations.reverse.each_with_index do |location, i|
      if i < 3
        puts "#{i+1}. #{location}"
      end
    end
  end
  puts "\n"
  view_locations
end

def get_favorite_locations_array
  favorite_locations = StartLocation.all.select do |start_location|
    start_location.favorite == true
  end.map {|favorite_location| favorite_location.name }

  EndLocation.all.select do |end_location|
    favorite_locations << end_location.name if end_location.favorite == true
  end
  favorite_locations.uniq
end

def view_favorite_locations
    if get_favorite_locations_array.empty?
      puts "You don't have any Favorites! Why don't you add one?"
      puts "\n"
      view_locations
    else
      puts "Favorite Locations:"
      get_favorite_locations_array.each_with_index do |location, i|
        puts "#{i+1}. #{location}"
      end
      
    end
    puts "\n"
    view_locations
  end

  def delete_location
      print_all_locations
      puts "\nPlease enter the location number you would like to delete:"
      location_to_delete = get_user_input.to_i
      system "clear"
      puts "\e[H\e[2J"
      if location_to_delete == 0 || location_to_delete > get_uniq_locations.length
        puts "Please enter a number between 1 and #{get_uniq_locations.length}"
        delete_location
      else
        puts "got to the delete methods!"
        location_name = get_uniq_locations[location_to_delete-1]
        start_loc_to_delete = StartLocation.where(name: location_name)
        end_loc_to_delete = EndLocation.where(name: location_name)
        #delete selected location in start and end location tables
        StartLocation.delete(start_loc_to_delete[0].id)
        EndLocation.delete(end_loc_to_delete[0].id)
        system "clear"
        puts "\e[H\e[2J"
        # view_all_locations
        end
        view_all_locations
    end

  def add_favorite_location
    #add a location to favorites
    puts "Here are all of your locations:"
    get_uniq_locations.each_with_index do |location, i|
        puts "#{i+1}: #{location}"
    end
    puts "\n Please enter the location number you want to add to favorites:"
    #get favorite location name
    favorite_location_number = gets.chomp.to_i
    system "clear"
    puts "\e[H\e[2J"

    if favorite_location_number == 0 || favorite_location_number > get_uniq_locations.length
      puts "\n Please enter a number between 1 and #{get_uniq_locations.length}"
      add_favorite_location
    else
      location_name = get_uniq_locations[favorite_location_number-1]
      #update start and end location in database with favorite
      StartLocation.where(name: location_name).update(favorite: true)
      EndLocation.where(name: location_name).update(favorite: true)
    end
    puts "\n"
    view_favorite_locations
  end

  def print_all_locations
    if get_uniq_locations.empty?
      puts "You don't have any locations yet! Start a new ride to add a location."
      puts "\n"
      main_menu
    else
      puts "Here are all of your locations:"
      get_uniq_locations.each_with_index do |location, i|
          puts "#{i+1}: #{location}"
      end
    end
  end

  def remove_favorite_location
    #delete a location from favorites
    view_favorite_locations
    puts "\n Please enter the location number you want to remove from Favorites:"
    #get favorite location name
    favorite_to_remove = gets.chomp.to_i
    system "clear"
    puts "\e[H\e[2J"

    if favorite_to_remove == 0 || favorite_to_remove > get_favorite_locations_array.length
      puts "\n Please enter a number between 1 and #{get_favorite_locations_array.length}"
      remove_favorite_location
    else
      location_name = get_favorite_locations_array[favorite_to_remove-1]
      #update start and end location in database with favorite
      StartLocation.where(name: location_name).update(favorite: false)
      EndLocation.where(name: location_name).update(favorite: false)
      
    end
    puts "\n"
    view_favorite_locations
  end
