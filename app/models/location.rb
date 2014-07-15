class Location < ActiveRecord::Base
  geocoded_by :city
  after_validation :geocode
  has_many :users
end
