
#Initial welcome title fun graphic
def welcome_title
  system "clear"
  puts "\e[H\e[2J"
  pastel = Pastel.new
  font = TTY::Font.new(:doom)
  title_name = pastel.cyan.bold(font.write("  RIDE - PRICER  "))
  title_name.each_char { |c| print c; sleep(0.002) }
  puts "\nWelcome to our sweet ride app!"
  puts "Type 'exit' at any time to exit."
  puts "\n"

end

#Persist title at top
def title
  system "clear"
  puts "\e[H\e[2J"
  pastel = Pastel.new
  font = TTY::Font.new(:doom)
  title_name = pastel.cyan.bold(font.write("  RIDE - PRICER  "))
  puts title_name
  title_name
end
