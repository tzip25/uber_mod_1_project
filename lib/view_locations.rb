def view_locations

  puts "Locations Menu"
  puts "1. View recent locations"
  puts "2. View all locations"
  puts "3. View Favorite locations"
  puts "4. Add a location to Favorites"
  puts "5. Remove a location from Favorites"
  puts "6. Go back to Main menu"
  user_input = gets.chomp.to_i
  system "clear"
  puts "\e[H\e[2J"

  if user_input == 1
  #todo - instead of last five, show each product type of the last ride name
  puts "Your three most recent locations are:"
    view_recent_locations

  elsif user_input == 2
    puts "Here are all of your locations:"
    #show all locations
    view_all_locations

  elsif user_input == 3
    puts "Favorite Locations:"
    #show favorites
    view_favorite_locations

  elsif user_input == 4
    #add a favorite location
    add_favorite_location

  elsif user_input == 5

    remove_favorite_location

  elsif user_input == 6
    welcome
  else
    "Please select an option from above"
    view_locations
  end

  view_locations
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
  get_uniq_locations.each_with_index do |location, i|
      puts "#{i+1}: #{location}"
  end
end

def view_recent_locations
  get_uniq_locations.each_with_index do |location, i|
    if i < 3
      puts "#{i+1}. #{location}"
    end
  end
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
      puts "You don't have any Favorites! Why don't you add some?"
      view_locations
    else
      get_favorite_locations_array.each_with_index do |location, i|
        puts "#{i+1}. #{location}"
      end
    end
  end

  def add_favorite_location
    #add a location to favorites
    view_all_locations
    puts "Please enter the location number you want to add to favorites:"
    #get favorite location name
    favorite_location_number = gets.chomp.to_i

    if favorite_location_number == 0 || favorite_location_number > get_uniq_locations.length
      puts "Please enter a number between 1 and #{get_uniq_locations.length}"
      add_favorite_location
    else
      location_name = get_uniq_locations[favorite_location_number-1]
      #update start and end location in database with favorite
      StartLocation.where(name: location_name).update(favorite: true)
      EndLocation.where(name: location_name).update(favorite: true)
    end
    view_favorite_locations
  end

  def remove_favorite_location
    #delete a location from favorites
    view_favorite_locations
    puts "Please enter the location number you want to remove from Favorites:"
    #get favorite location name
    favorite_to_remove = gets.chomp.to_i

    if favorite_to_remove == 0 || favorite_to_remove > get_favorite_locations_array.length
      puts "Please enter a number between 1 and #{get_favorite_locations_array.length}"
      remove_favorite_location
    else
      location_name = get_favorite_locations_array[favorite_to_remove-1]
      #update start and end location in database with favorite
      StartLocation.where(name: location_name).update(favorite: false)
      EndLocation.where(name: location_name).update(favorite: false)
      binding.pry
    end
    view_favorite_locations
  end
