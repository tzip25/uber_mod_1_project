#Build main menu and application functionality
##Main menu options inlclude: go to ride menu, go to who rides menu, go to view locations menu
def main_menu
  main_menu_array = [:start_new_ride, :ride_menu, :location_menu]
  application_builder("Main Menu", main_menu_array)
end
