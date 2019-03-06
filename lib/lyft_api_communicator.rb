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
end


def persist_lyft_ride(api_response, start_address, end_address)
    puts "\n↓ Check out these sweet ride options!"
    api_response["cost_estimates"].each do |ride|
      #hid the lyft persisting code below for now... need to finalize these methods 
     # Ride.find_or_create_by(name: "#{start_address.name} to #{end_address.name}", start_location_id: start_address.id, end_location_id: end_address.id, product_type: ride["display_name"], estimate: ride["estimate"], high_estimate: ride["high_estimate"], low_estimate: ride["low_estimate"], distance: ride["distance"], duration: ride["duration"])

    # puts "Data for ride from #{start_address.name} to #{end_address.name}"
    min_price_dollars = (ride["estimated_cost_cents_min"].to_f / 100)
    max_price_dollars = (ride["estimated_cost_cents_max"].to_f / 100)
    puts "#{ride["ride_type"]}: $#{min_price_dollars}-#{max_price_dollars}"
    end
    puts "-----------------------------------"
end

def run_new_lyft_ride
    start_address = get_start_address
    end_address = get_end_address
    api_response = run_lyft_api(start_address, end_address)
    persist_lyft_ride(api_response, start_address, end_address)
    new_ride_menu
end
