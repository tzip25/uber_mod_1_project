def pick_type
  puts "Ride Types"
  puts "1. UberX/Lyft"
  puts "2. UberXL/Lyft Plus"
  puts "3. Uber Black/Lyft Lux"
  puts "4. Uber Black SUV/Lyft Lux SUV"
  puts "5. Uber Pool/Lyft Line" #maybe make this just lyft... or remove it
  puts "6. Exit"
  puts "\nPlease enter your selection:"
  get_user_input =  gets.chomp.to_i
  system "clear"
  puts "\e[H\e[2J"
  if get_user_input == 1
    ride_date_by_type("UberX", "lyft")
  elsif get_user_input == 2
    ride_date_by_type("UberXL", "lyft_plus")
  elsif get_user_input == 3
    ride_date_by_type("Black", "lyft_lux")
  elsif get_user_input == 4
    ride_date_by_type("Black SUV", "lyft_luxsuv")
  elsif get_user_input == 5
    ride_date_by_type("Pool", "lyft_line")
  elsif get_user_input == 6
    welcome
  else
    #add error handling 
  end
end

def ride_date_by_type(uber, lyft)
  puts "Ride type selected: #{uber}/#{lyft} \n"
  uber_rides_arr = Ride.where(product_type: "#{uber}")
  lyft_rides_arr = Ride.where(product_type: "#{lyft}")
  rides_arr = (uber_rides_arr + lyft_rides_arr).sort_by {|ride| ride.name}
  rides_arr.each do |ride|
    puts "#{ride.name.ljust(60)}: #{ride.product_type.ljust(15)} | #{ride.estimate.ljust(15)} | #{ride.created_at}"
  end
end



def run_ride_by_type
  pick_type
  puts "\n"
end
