class Ride < ActiveRecord::Base
  belongs_to :start_location
  belongs_to :end_location
end
