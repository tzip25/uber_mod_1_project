require_relative '../config/environment'
require '/Users/ryanrosztoczy/Development/Projects/Gems/cli_builder/lib/cli_builder/menu.rb'


# #Generate initial application title
welcome_title

#Buid main menu and application functionality
def crud_menu
  CliBuilder::Crud.build_model_menu
end

  main_menu_array = [:start_new_ride, :ride_menu, :location_menu, :crud_menu]
  main_menu = CliBuilder::Menu.new(title: "Main Menu", menu_options: main_menu_array)
  main_menu.build_menu




