#Builds out application menu and method functionality
def self.location_menu
  location_menu_array = [:view_recent_locations, :view_all_locations, :delete_location, :view_favorite_locations, :add_favorite_location, :remove_favorite_location, :main_menu]
  application_builder("View Locations", location_menu_array)
end

#Turns db location names into list of uniq values for printing etc.
def get_uniq_locations
  start_array = StartLocation.all.map { |start_location| start_location.name }
  EndLocation.all.each { |end_location| start_array << end_location.name }
  uniq_arr = start_array.uniq
  uniq_arr
end

#Prints all locations, loops menu
def view_all_locations
  print_all_locations
  puts "\n"
  location_menu
end

#Prints out 3 most recent locations
def view_recent_locations
  if get_uniq_locations.empty?
    puts "You don't have any locations yet! Start a new ride to add a location."
    puts "\n"
    main_menu
  else
    puts "Your three most recent locations are:"
    get_uniq_locations.reverse.each_with_index { |location, i| (puts "#{i+1}. #{location}" if i < 3)}
  end
  puts "\n"
  location_menu
end

#Gets favorite locations from db into array for manipulation for printing
def get_favorite_locations_array
  favorite_locations = StartLocation.all.select do |start_location|
    start_location.favorite == true
  end.map {|favorite_location| favorite_location.name }

  EndLocation.all.select do |end_location|
    favorite_locations << end_location.name if end_location.favorite == true
  end
    favorite_locations.uniq
end

#Prints favorite locations
def prints_favorite_locations
  puts "Favorite Locations:"
  get_favorite_locations_array.each_with_index { |location, i| puts "#{i+1}. #{location}" }
end

#Prints favorite locations, loops menu
def view_favorite_locations
    if get_favorite_locations_array.empty?
      puts "You don't have any Favorites! Why don't you add one?"
      puts "\n"
      location_menu
    else
      prints_favorite_locations
    end
    puts "\n"
    location_menu
  end

#Delete location functionality
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
      location_name = get_uniq_locations[location_to_delete-1]
      start_loc_to_delete = StartLocation.where(name: location_name)
      end_loc_to_delete = EndLocation.where(name: location_name)
      #delete selected location in start and end location tables
      StartLocation.delete(start_loc_to_delete[0].id)
      EndLocation.delete(end_loc_to_delete[0].id)
      #title page------
      title
      #end title page----
      puts "Your location has been deleted!"
      puts "\n"
      print_all_locations

      end
      puts "\n"
      location_menu
  end

  #Add favorite location functionality
  def add_favorite_location

    if get_uniq_locations.empty?
      puts "You don't have any locations yet! Start a new ride to add a location."
      puts "\n"
      location_menu
    else
      #add a location to favorites
      puts "Here are all of your locations:"
      get_uniq_locations.each_with_index { |location, i| puts "#{i+1}: #{location}" }
      puts "\nPlease enter the location number you want to add to favorites:"
      #get favorite location name
      favorite_location_number = get_user_input.to_i
      #title page------
      title
      #end title page----

      if favorite_location_number == 0 || favorite_location_number > get_uniq_locations.length
        puts "\nPlease enter a number between 1 and #{get_uniq_locations.length}"
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
  end

  #Remove favorite location functionality
  def remove_favorite_location

    if get_favorite_locations_array.empty?
      puts "You don't have any Favorites! Why don't you add one?"
      puts "\n"
      location_menu
    else
      #delete a location from favorites
      prints_favorite_locations
      puts "\nPlease enter the location number you want to remove from Favorites:"
      #get favorite location name
      favorite_to_remove = get_user_input.to_i
      #title page------
      title
      #end title page----

      if favorite_to_remove == 0 || favorite_to_remove > get_favorite_locations_array.length
        puts "\nPlease enter a number between 1 and #{get_favorite_locations_array.length}"
        remove_favorite_location
      else
        location_name = get_favorite_locations_array[favorite_to_remove-1]
        #update start and end location in database with favorite
        StartLocation.where(name: location_name).update(favorite: false)
        EndLocation.where(name: location_name).update(favorite: false)
        puts "Your favorite has been removed!"
      end
      puts "\n"
      view_favorite_locations
    end
  end

   #Prints all locations
   def print_all_locations
    if get_uniq_locations.empty?
      puts "You don't have any locations yet! Start a new ride to add a location."
      puts "\n"
      main_menu
    else
      puts "Here are all of your locations:"
      get_uniq_locations.each_with_index { |location, i| puts "#{i+1}: #{location}" }
    end
  end
