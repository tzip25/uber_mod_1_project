require 'net/http'
require 'uri'

def get_start_location
  StartLocation.last
end

def get_end_location
  EndLocation.last
end

######### Uber API #################
def get_uber_api
#convert Uber curl API to ruby
uri = URI.parse("https://api.uber.com/v1.2/estimates/price?start_latitude=#{get_start_location.lat}&start_longitude=#{get_start_location.long}&end_latitude=#{get_end_location.lat}&end_longitude=#{get_end_location.long}")
request = Net::HTTP::Get.new(uri)
request.content_type = "application/json"
request["Authorization"] = "Token #{ENV['UBER_API']}"
request["Accept-Language"] = "en_US"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

response.code
body = response.body
response = JSON.parse(body)
body = JSON.parse(body)
end

################### METHODS ##################
def save_UberX_ride
  get_uber_api["prices"].each do |ride|
    # binding.pry
    # Ride.create(ride, start_location_id: )
  end
end

# def display_results
#   get_uber_api["prices"].map do |ride|
#     puts "#{ride["display_name"]}: #{ride["estimate"]}"
#   end
#   puts "↑ Check out those sweet ride options!"
# end

def get_uber_ride_types
  get_uber_api["prices"].map do |ride|
    ride["display_name"]
  end
end
