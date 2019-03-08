

#Build  out the ride menu and functionality
def self.ride_menu
  ride_menu_array = [:view_by_route, :ride_by_type_menu, :favorite_ride_menu, :main_menu]
  application_builder("Ride Menu", ride_menu_array)
end

