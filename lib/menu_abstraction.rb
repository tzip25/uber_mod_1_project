#####Current Progress:
#succesfully implemented the new ride menu. Need to:
#implement other menus based on selection, then:
#menu looping ;)



##########################Abstracted Menu Structure
#1. Puts a list of menu options based on method input array (string interpolated from menu function name and a "humanize" method)
#2. does this:
## puts "\nPlease enter your selection:"
## get_user_input =  gets.chomp
## system "clear"
## puts "\e[H\e[2J"
#3. Builds an if tree (sometimes while loop?) for each of those options using the option index and runs the method put into the array

def application_builder(application_name, method_names)
  build_menu(application_name, method_names)
  build_if_tree(application_name, method_names)
end

def build_menu(application_name, method_names)
  #take array of method names and turn into menu
  puts "#{application_name.humanize}"
  method_names.each_with_index {|method_name, index| puts "#{index + 1}: #{method_name.to_s.humanize}"}
  puts "Please enter your selection:"
end

#add while not exit loop
def build_if_tree(application_name, method_names)
  get_user_input = gets.chomp
  # system "clear"
  # puts "\e[H\e[2J"
  while get_user_input != "exit"
    #look through each option and compare to input, if it has an associated method, run it. If no matches, prompt to enter a valid option and start again.
    method_names.each_with_index do |method_name, index| 
      if get_user_input.to_i == index + 1
        return send(method_name)
      end
    end
        #returns error message if not a valid option
        puts "****Error: Please enter a valid number****"
        application_builder(application_name, method_names)
  end
end



# #then define an if statement based off of those method names, running them insi
#   define_method(method_name) do
#     puts "SELECT * FROM #{method_name} WHERE..."
#     puts "Returning #{method_name}..."
#     []
#   end
# end
# end


# ##########################Welcome menu
#     def welcome
#       puts "Main Menu"
#       puts "1. Start a new ride"
#       puts "2. View ride history"
#       puts "3. View my locations"
#       puts "4. Exit"
#       puts "\nPlease enter your selection:"
#       get_user_input =  gets.chomp
#       system "clear"
#       puts "\e[H\e[2J"

#       #loop menu until exit is selected
#       while get_user_input != "exit"
#         if get_user_input.to_i == 1
#           #run new_ride.rb methods
#           new_ride_menu
#         elsif get_user_input.to_i == 2
#           #go to antoher sub-menu - will include Ride.all
#           show_rides
#         elsif get_user_input.to_i == 3
#           #go to antoher sub-menu - will include Locations from one table, make sure this has option to delete
#           view_locations
#         elsif get_user_input.to_i == 4
#           #exits program
#           exit
#         elsif get_user_input
#           #returns error message if not integer 1-4, allows you to enter again
#           puts "Please enter a valid option between 1 and 4:"
#           welcome 
#         end
#       end
#       #for some reason this doesn't actually exit
#       exit
#     end

# #########################Ride Menu
#     def new_ride_menu
#       puts "\n"
#       puts "New Ride Menu:"
#       puts "1. Enter a new address"
#       puts "2. See a list of previous addresses to choose from"
#       puts "3. Go back to main menu"
#       user_selection = gets.chomp.to_i
#       #use below to "clear" terminal windown before proceeding
#       system "clear"
#       puts "\e[H\e[2J"
      
#         if user_selection == 1
#           #run new_ride_menu using runner method
#           run_new_ride
#         elsif user_selection == 2
#           #get list of addresses from database
#           view_all_locations
#           #TODO update number validations for this
#           run_new_ride
#         elsif user_selection == 3
#           welcome
#         else
#           puts "Dude! That's not a valid selection. Please enter a number between 1 and 3:"
#           new_ride_menu
#           end
#       end

# #########################Show Rides Menu

#       def show_rides
#         # puts "Here is the data from your last price check:"
#         # puts "\n"
#         # #todo - instead of last five, show each product type of the last ride name
#         # Ride.last(10).each do |ride|
#         # puts "#{ride.name}: #{ride.product_type} | #{ride.estimate} "
#         #
#         # end
#         # puts "-----------------------------------------------------"
#         # puts "\n"
#         # welcome
#         puts "Ride Menu:"
#         puts "1. View by route"
#         puts "2. View by ride type"
#         puts "3. Favorite rides"
#         puts "4. Go back to Main menu"
      
#         user_input = gets.chomp.to_i
#         system "clear"
#         puts "\e[H\e[2J"
      
#         if user_input == 1
#           #run view by routes
#           run_view_routes
#         elsif user_input == 2
#           #run ride_by_type
#           run_ride_by_type
#         elsif user_input == 3
#           #Bring up list of favorites
#           favorite_rides
#         elsif user_input == 4
#          welcome
#         else
#           #error handling
#           puts "Please enter a valid option between 1 and 4:"
#           puts "\n"
#           show_rides
#         end
#       end
      
# #########################View Rides Menu

#       def view_locations

#         puts "Locations Menu:"
#         puts "1. View recent locations"
#         puts "2. View all locations"
#         puts "3. View Favorite locations"
#         puts "4. Add a location to Favorites"
#         puts "5. Remove a location from Favorites"
#         puts "6. Go back to Main menu"
#         user_input = gets.chomp.to_i
#         system "clear"
#         puts "\e[H\e[2J"
      
#         if user_input == 1
#         #todo - instead of last five, show each product type of the last ride name
#           view_recent_locations
      
#         elsif user_input == 2
#           #show all locations
#           view_all_locations
      
#         elsif user_input == 3
#           #show favorites
#           view_favorite_locations
      
#         elsif user_input == 4
#           #add a favorite location
#           add_favorite_location
      
#         elsif user_input == 5
      
#           remove_favorite_location
      
#         elsif user_input == 6
#           welcome
#         else
#           "Please select an option from above"
#           view_locations
#         end
#         puts "\n"
#         view_locations
#       end
      

  
