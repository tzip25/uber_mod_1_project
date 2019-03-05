def view_locations

  puts "Locations Menu"
  puts "1. View recent locations"
  puts "2. View all locations"
  puts "3. View Favorite locations"
  puts "4. Add a location to Favorites"
  user_input = gets.chomp.to_i

  if user_input == 1
  #todo - instead of last five, show each product type of the last ride name
    view_recent_locations

  elsif user_input == 2
    #show all locations
    view_all_locations

  elsif user_input == 3
    #show favorites
    view_favorite_locations

  elsif user_input == 4
    #add a location to favorites
    view_all_locations
    puts "Please enter the location number you want to add to favorites:"
    favorite_location_number = gets.chomp.to_i
    #get favorite location name
    location_name = get_uniq_locations[favorite_location_number - 1]
    #update start and end location in database with favorite
    StartLocation.where(name: location_name).update(favorite: true)
    EndLocation.where(name: location_name).update(favorite: true)
    view_favorite_locations
  else
    "Please select an option from above"
    view_locations
  end
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
  StartLocation.all.each_with_index do |start_location, i|
    if i < 3
      puts "#{i+1}: #{start_location.name}"
    end
  end
  EndLocation.all.each_with_index do |end_location, i|
    if i < 3
      puts "#{i+1}: #{end_location.name}"
    end
  end
end

def view_favorite_locations
  favorite_locations = StartLocation.all.select do |start_location|
    start_location.favorite == true
  end.map {|favorite_location| favorite_location.name }

  EndLocation.all.select do |end_location|
    favorite_locations << end_location.name if end_location.favorite == true
  end

    if favorite_locations.empty?
      puts "You don't have any Favorites!"
      view_locations
    else
      favorite_locations.each_with_index do |location, i|
        puts "#{i+1}: #{location}"
      end
    end
  end
