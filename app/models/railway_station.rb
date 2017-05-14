class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :first_station_id
  has_many :end_tickets, class_name: 'Ticket', foreign_key: :last_station_id
  
  def set_number_in_route(current_route, number)
    railway_stations_routes.where(route: current_route).first.update({station_number_in_route: number})
  end
  
  
  def number_in_route(current_route)
    railway_stations_routes.where(route: current_route).first.station_number_in_route
  end
end
