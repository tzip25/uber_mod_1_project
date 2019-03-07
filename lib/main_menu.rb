#Build main menu and application functionality
##Main menu options inlclude: go to ride menu, go to who rides menu, go to view locations menu
def main_menu
  main_menu_array = [:new_ride_menu, :show_rides, :view_locations]
  application_builder("Main Menu", main_menu_array)
end
