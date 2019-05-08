require_relative '../config/environment'
require '/Users/ryanrosztoczy/Development/Projects/Gems/cli_builder/lib/cli_builder/menu.rb'

CliBuilder::Crud.get_tables
CliBuilder::Crud.build_model_menu

# #Generate initial application title
welcome_title

#Buid main menu and application functionality
main_menu





