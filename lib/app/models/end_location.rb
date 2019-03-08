class EndLocation < ActiveRecord::Base
  has_many :rides
  has_many :start_locations, through: :rides
end
