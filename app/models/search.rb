class Search

  
  def self.find_trains(begin_station, end_station)
    
    routes = Route.joins(:railway_stations_routes).where(railway_stations_routes: { railway_station_id: begin_station.id }) &
             Route.joins(:railway_stations_routes).where(railway_stations_routes: { railway_station_id: end_station.id })
    
    routes.select! { |route| begin_station.number_in_route(route) < end_station.number_in_route(route) }
    
    Train.joins(:route).where(route: routes)
  end
end
