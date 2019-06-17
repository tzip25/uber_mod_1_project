

#Build  out the ride menu and functionality
def self.ride_menu
  ride_menu_array = [:view_by_route, :ride_by_type_menu, :favorite_ride_menu, :main_menu]
  previous_ride_menu = CliBuilder::Menu.new(title: "Ride Menu", menu_options: ride_menu_array)
  previous_ride_menu.build_menu
end

