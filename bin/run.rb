require_relative '../config/environment'
require '/Users/ryanrosztoczy/Development/Projects/Gems/cli_builder/lib/cli_builder.rb'
# require '/Users/ryanrosztoczy/Development/Projects/Gems/csli_builder/lib/cli_builder/menu.rb'
# require '/Users/ryanrosztoczy/Development/Projects/Gems/cli_builder/lib/cli_builder/crud.rb'


# #Generate initial application title
welcome_title

#Buid main menu and application functionality


  start_new_ride_menu_array = [:run_new_ride, :select_from_previous_locations]
  new_ride_menu = CliBuilder::Menu.new(title: "Start New Ride", menu_options: start_new_ride_menu_array)

  favorite_rides_menu_array = [:view_favorite_rides, :add_favorite_ride, :remove_favorite_rides]
  favorite_rides_menu = CliBuilder::Menu.new(title: "Favorite Rides", menu_options: favorite_rides_menu_array)

  ride_menu_array = [:view_by_route, favorite_rides_menu]
  previous_ride_menu = CliBuilder::Menu.new(title: "Ride Menu", menu_options: ride_menu_array)

  location_menu_array = [:view_recent_locations, :view_all_locations, :delete_location, :view_favorite_locations, :add_favorite_location, :remove_favorite_location]
  location_menu = CliBuilder::Menu.new(title: "Location Menu", menu_options: location_menu_array)

  main_menu_array = [new_ride_menu, previous_ride_menu, location_menu, :crud_menu]
  main_menu = CliBuilder::Menu.new(title: "Main Menu", menu_options: main_menu_array)
  
  main_menu.build_menu




