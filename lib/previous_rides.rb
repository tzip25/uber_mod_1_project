def self.view_rides_menu
  # puts "Here is the data from your last price check:"
  # puts "\n"
  # #todo - instead of last five, show each product type of the last ride name
  # Ride.last(10).each do |ride|
  # puts "#{ride.name}: #{ride.product_type} | #{ride.estimate} "
  #
  # end
  # puts "-----------------------------------------------------"
  # puts "\n"
  # welcome
  show_rides_array = [:view_by_route, :view_rides_by_type, :favorite_rides, :main_menu]
  application_builder("Show Ride Menu", show_rides_array)
   # TODO: LOOPS THROUGH SHOWING ROUTES in view_by_route
end
 
  # view_rides_by_type
  # favorite_rides
  # main_menu

#   puts "Ride Menu:"
#   puts "1. View by route"
#   puts "2. View by ride type"
#   puts "3. Favorite rides"
#   puts "4. Go back to Main menu"

#   user_input = gets.chomp.to_i
#   system "clear"
#   puts "\e[H\e[2J"

#   if user_input == 1
#     #run view by routes
#     view_by_route
#   elsif user_input == 2
#     #run ride_by_type
#     view_rides_by_type
#   elsif user_input == 3
#     #Bring up list of favorites
#     favorite_rides
#   elsif user_input == 4
#    main_menu
#   else
#     #error handling
#     puts "Please enter a valid option between 1 and 4:"
#     puts "\n"
#     show_rides
#   end
# end


#   def view_by_ride_type
#     #will give a unique list of ride types (i.e. UberX, XL, Lyft, Lyft Line...)
#     #will return all rides for selected type
#   end

#   view_by_route
#   view_rides_by_type
#   favorite_rides
#   main_menu
