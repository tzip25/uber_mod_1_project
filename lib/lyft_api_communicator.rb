     require 'net/http'
     require 'uri'

def run_lyft_api(start_address, end_address)

     uri = URI.parse("https://api.lyft.com/v1/cost?start_lat=#{start_address.lat}&start_lng=#{start_address.long}&end_lat=#{end_address.lat}&end_lng=#{end_address.long}")
     request = Net::HTTP::Get.new(uri)
     request["Authorization"] = "bearer #{ENV['LYFT_API']}"

     req_options = {
       use_ssl: uri.scheme == "https",
     }

     response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
       http.request(request)
     end

     response.code
     body = response.body
     response = JSON.parse(body)

     #Error handling for lyft api
       if response["error"] ==  "no_service_in_area"
         puts "I'm sorry, that is not a valid ride."
         start_new_ride
       else
         puts "\n"
         response
       end

end
