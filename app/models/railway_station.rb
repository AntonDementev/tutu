class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id
  has_many :start_tickets, class_name: 'Ticket', foreign_key: :first_station_id
  has_many :end_tickets, class_name: 'Ticket', foreign_key: :last_station_id
  
  
  scope :ordered_by_number_in_route, -> {joins(:railway_stations_routes).order("railway_stations_routes.station_number_in_route").uniq }
  
  
  def set_number_in_route(current_route, number)
    station_route = station_route(current_route)
    station_route.update(station_number_in_route: number) if station_route
  end
  
  def set_time(current_route, time_to_station, time_from_station)
    station_route = station_route(current_route)
    station_route.update({time_to_station: time_to_station, time_from_station: time_from_station}) if station_route
  end
  
  
  def number_in_route(current_route)
    station_route(current_route).try(:station_number_in_route)
  end
  
  def time_to_in_route(current_route)
    station_route(current_route).try(:time_to_station)
  end
  
  def time_from_in_route(current_route)
    station_route(current_route).try(:time_from_station)
  end
  
  protected
  
  def station_route(current_route)
    @station_route = railway_stations_routes.where(route: current_route).first
  end
end
