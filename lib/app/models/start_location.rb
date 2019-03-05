class StartLocation < ActiveRecord::Base
  has_many :rides
  has_many :end_locations, through: :rides
end
