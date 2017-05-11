class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :first_station_id
  has_many :end_tickets, class_name: 'Ticket', foreign_key: :last_station_id
  
  def set_number_in_route(route, number)
    set_number_in_route_by_id(route.id, number)
  end
  
  def set_number_in_route_by_id(route_id, number)
    railway_stations_routes.each do |statoin_route|
      if statoin_route.route_id == route_id
        statoin_route.station_number_in_route = number
        statoin_route.save
      end
    end
  end
  
  def number_in_route(route)
    number_in_route_id(route.id)
  end
  
  def number_in_route_id(route_id)
    railway_stations_routes.each do |statoin_route|
      if statoin_route.route_id == route_id
        @number = statoin_route.station_number_in_route
      end
    end
    @number
  end
end
