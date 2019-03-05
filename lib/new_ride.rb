def new_ride_menu

end

def get_start_address
  "Enter a start address:"
  start_address = gets.chomp
end

def geocoder
  results = Geocoder.search(get_start_address)
  results.first.coordinates
end

def start_latitude
  results.first.coordinates[0]
end

def start_longitude
  results.first.coordinates[1]
end

def get_end_address
end
