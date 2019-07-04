require 'net/http'
require 'uri'

######### Uber API #################
def get_uber_api(start_address, end_address)
#convert Uber curl API to ruby

uri = URI.parse("https://api.uber.com/v1.2/estimates/price?start_latitude=#{start_address.lat}&start_longitude=#{start_address.long}&end_latitude=#{end_address.lat}&end_longitude=#{end_address.long}")
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
# binding.pry
puts "\n"
#spinner
spinner = TTY::Spinner.new(format: :arrow_pulse)
spinner.auto_spin # Automatic animation with default interval
sleep(3) # Perform task
spinner.stop('Done!') # Stop animation

#Error handling for uber api
  if !response["prices"].nil?
    response
  else
    puts "I'm sorry, that is not a valid ride. #{response}"
    puts "\n"
    run_new_ride
  end
end
