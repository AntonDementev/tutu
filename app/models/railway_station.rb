class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :first_station_id
  has_many :end_tickets, class_name: 'Ticket', foreign_key: :last_station_id
end
