def show_rides
  puts "Here is the data from your last price check:"
  puts "\n"
  #todo - instead of last five, show each product type of the last ride name
  Ride.last(10).each do |ride|
  puts "#{ride.name}: #{ride.product_type} | #{ride.estimate} "

  end
  puts "-----------------------------------------------------"
  puts "\n"
  welcome
end
