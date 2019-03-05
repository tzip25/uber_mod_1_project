def show_rides
  #todo - instead of last five, show each product type of the last ride name
  Ride.last(5).each do |ride|
  puts "#{ride.name}: #{ride.product_type} | #{ride.estimate} "
  end
  "Data for your last price check"
end
