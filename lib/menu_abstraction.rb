

# #Build out terminal application menu and user interaction behavior
# def application_builder(application_name, method_names)
#   build_menu(application_name, method_names)
#   build_if_tree(application_name, method_names)
# end

# #Dynamically build menu based off of methods used in this portion of the application (the portion defined by the menu)
# def build_menu(application_name, method_names)
#   #take array of method names and turn into menu
#   puts "#{application_name.humanize}"
#   method_names.each_with_index {|method_name, index| puts "#{index + 1}: #{method_name.to_s.humanize}"}
#   puts "\nPlease enter your selection:"
# end

# #Dynamically build application interaction functionality (if tree based on menu selection that runs selected methods)
# def build_if_tree(application_name, method_names)
#   user_input = get_user_input

#   #title page------
#   title
#   #end title page----

#     #look through each option and compare to input, if it has an associated method, run it. If no matches, prompt to enter a valid option and start again.
#     method_names.each_with_index do |method_name, index|
#       if user_input.to_i == index + 1
#         #had return send(method_name)
#         send(method_name)
#       end
#     end
#         #returns error message if not a valid option
#         if !user_input.to_i.between?(1, method_names.length)
#         puts "\n****Error: Please enter a valid number****"
#         puts "\n"
#         application_builder(application_name, method_names)
#         end
#   end

# #Get user input, exit on exit
# def get_user_input
#   user_input = gets.chomp
#   user_input == "exit" ? exit : user_input
# end
