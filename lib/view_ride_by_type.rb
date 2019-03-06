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
    puts "Ride type selected: UberX/Lyft"
    uber_rides_arr = Ride.where(product_type: "UberX")
    lyft_rides_arr = Ride.where(product_type: "lyft")
    rides_arr = (uber_rides_arr + lyft_rides_arr).sort_by {|ride| ride.name}
    rides_arr.each do |ride|
      puts "#{ride.name}: #{ride.product_type} | #{ride.created_at} | #{ride.estimate}"
    end
  elsif get_user_input == 2
    puts "Ride type selected: UberXL/Lyft Plus"
    uber_rides_arr = Ride.where(product_type: "UberXL")
    lyft_rides_arr = Ride.where(product_type: "lyft_plus")
    rides_arr = (uber_rides_arr + lyft_rides_arr).sort_by {|ride| ride.name}
    rides_arr.each do |ride|
      puts "#{ride.name}: #{ride.product_type} | #{ride.created_at} | #{ride.estimate}"
    end
  elsif get_user_input == 3
    puts "Ride type selected: Uber Black/Lyft Lux"
    uber_rides_arr = Ride.where(product_type: "lack")
    lyft_rides_arr = Ride.where(product_type: "lyft_lux")
    rides_arr = (uber_rides_arr + lyft_rides_arr).sort_by {|ride| ride.name}
    rides_arr.each do |ride|
      puts "#{ride.name}: #{ride.product_type} | #{ride.created_at} | #{ride.estimate}"
    end
  elsif get_user_input == 4
    puts "Ride type selected: Uber Black SUV/Lyft Lux SUV "
    uber_rides_arr = Ride.where(product_type: "Black SUV")
    lyft_rides_arr = Ride.where(product_type: "lyft_luxsuv")
    rides_arr = (uber_rides_arr + lyft_rides_arr).sort_by {|ride| ride.name}
    rides_arr.each do |ride|
      puts "#{ride.name}: #{ride.product_type} | #{ride.created_at} | #{ride.estimate}"
    end
  elsif get_user_input == 5
    puts "Ride type selected: Uber Pool/Lyft Line"
    uber_rides_arr = Ride.where(product_type: "Uber Pool")
    lyft_rides_arr = Ride.where(product_type: "lyft_line")
    rides_arr = (uber_rides_arr + lyft_rides_arr).sort_by {|ride| ride.name}
    rides_arr.each do |ride|
      puts "#{ride.name}: #{ride.product_type} | #{ride.created_at} | #{ride.estimate}"
    end
  elsif get_user_input == 6
    welcome
  else
    #add error handling 
  end
end




def run_ride_by_type
  pick_type
end
