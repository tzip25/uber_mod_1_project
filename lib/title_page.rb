
def title
  system "clear"
  puts "\e[H\e[2J"

  pastel = Pastel.new
  font = TTY::Font.new(:doom)
  string = pastel.cyan.bold(font.write("  RIDE - PRICER  "))
  string.each_char { |c| print c; sleep(0.002) }
  puts "\n"
  puts "Welcome to our sweet ride app!"
  puts "Type 'exit' at any time to exit."
end
