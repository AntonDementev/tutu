class SearchesController < ApplicationController
  before_action :get_stations, only: [:show, :create]

  def show
   
  end
  
  
  def create
    
    @begin_station = RailwayStation.find(search_params[:begin_station_id])
    @end_station = RailwayStation.find(search_params[:end_station_id])
    @trains = Search.find_trains(@begin_station, @end_station)
    
    render :show
  end
  
  private

  def get_stations
    @stations = RailwayStation.all
  end
  
  def search_params
    params.require(:search).permit(:begin_station_id, :end_station_id)
  end

end
