def pick_type
  puts "Ride Types"
  puts "1. UberX/Lyft"
  puts "2. UberXL/Lyft Plus"
  puts "3. Uber Black/Lyft Lux"
  puts "4. Uber Black SUV/Lyft Lux SUV"
  puts "5. Uber Pool/Lyft Line" #maybe make this just lyft... or remove it
  puts "6. Go back to Main Menu"
  puts "\nPlease enter your selection:"
  user_input =  get_user_input.to_i
  system "clear"
  puts "\e[H\e[2J"
  if Ride.all.empty?
    puts "You don't have any rides yet!"
    puts "\n"
    welcome
  else
  system "clear"
  puts "\e[H\e[2J"
  if user_input == 1
    ride_date_by_type("UberX", "lyft")
  elsif user_input == 2
    ride_date_by_type("UberXL", "lyft_plus")
  elsif user_input == 3
    ride_date_by_type("Black", "lyft_lux")
  elsif user_input == 4
    ride_date_by_type("Black SUV", "lyft_luxsuv")
  elsif user_input == 5
    ride_date_by_type("Pool", "lyft_line")
  else user_input == 6
    welcome
  end
end
end

def ride_date_by_type(uber, lyft)
  puts "Ride type selected: #{uber}/#{lyft} \n"
  uber_rides_arr = Ride.where(product_type: "#{uber}")
  lyft_rides_arr = Ride.where(product_type: "#{lyft}")
  rides_arr = (uber_rides_arr + lyft_rides_arr).sort_by {|ride| ride.name}
  rides_arr.each do |ride|
    puts "#{ride.name.ljust(50)} | #{ride.product_type.ljust(12)} | #{ride.estimate.ljust(12)} | #{ride.created_at}"
  end
end

def run_ride_by_type
  pick_type
  puts "\n"
  show_rides
end
