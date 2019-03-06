
def title
  system "clear"
  puts "\e[H\e[2J"
  pastel = Pastel.new
  font = TTY::Font.new(:doom)
  puts pastel.black.on_cyan.bold(font.write(" UBER   PRICE   APP "))
end
