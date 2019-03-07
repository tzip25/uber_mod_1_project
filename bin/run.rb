require_relative '../config/environment'

puts "hello?"
puts title
new_ride_menu_array = [:run_new_ride, :select_from_previous_locations, :main_menu]
puts new_ride_menu_array.inspect
application_builder("New Ride Menu", new_ride_menu_array)
main_menu

