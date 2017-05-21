class Search < ApplicationRecord
  
  def begin_station
    if begin_station_id
      RailwayStation.all.where(id: begin_station_id).first.title
    end
  end
  
  def end_station
    if end_station_id
      RailwayStation.all.where(id: end_station_id).first.title
    end
  end
  
  def create_new_ticket
    
  end
  
  def find_routes
    @result = []
    begin_station = RailwayStation.all.where(id: begin_station_id).first
    end_station = RailwayStation.all.where(id: end_station_id).first
    
    
    Route.all.each do |route|
      if route.railway_stations.include? begin_station and route.railway_stations.include? end_station and begin_station.number_in_route(route) < end_station.number_in_route(route)
        @result << {route: route, begin_station: begin_station, end_station: end_station}
      end
    end
    @result
  end
end
