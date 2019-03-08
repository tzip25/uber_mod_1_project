

#We could make this more extensible by mapping product types in the db and building the array from the db...
def self.ride_by_type_menu
  ride_type_array = ["UberX&lyft", "UberXL&lyft_plus", "Black&yft_lux", "Black SUV&lyft_luxsuv", "UberPool&lyft_line"]

  #Dynamically defines methods for the application builder using the product types
  ride_type_array.each_with_index do |mapped_product_type, index|
    define_method :"#{mapped_product_type}" do

      #breaks apart product types to access appropriate db values
      uber = mapped_product_type.split("&")[0]
      lyft = mapped_product_type.split("&")[1]
      uber_rides_arr = Ride.where(product_type: "#{uber}")
      lyft_rides_arr = Ride.where(product_type: "#{lyft}")

      #formats and puts out ride data
      rides_arr = (uber_rides_arr + lyft_rides_arr).sort_by {|ride| ride.name}
      rides_arr.each do |ride|
        puts "#{ride.name.ljust(50)} | #{ride.product_type.ljust(12)} | #{ride.estimate.ljust(12)} | #{ride.created_at}"
      end
      ride_menu
    end
  end

  #Builds dynamic application menu and functionality from product definitions
  application_builder("Find Ride Data by Type", ride_type_array)
end
