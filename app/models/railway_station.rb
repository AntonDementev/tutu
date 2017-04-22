class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id
  has_many :tickets, foreign_key: :first_station_id
  has_many :tickets, foreign_key: :last_station_id
end
