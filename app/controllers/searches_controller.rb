class SearchesController < ApplicationController
  before_action :set_search

  def show
  end
  
  def update
    if @search.update(search_params)
      redirect_to @search
    else
      render :show
    end
  end
  
  
  private
  
  def set_search
    @search = Search.first
  end
  
  def search_params
    params.require(:search).permit(:begin_station_id, :end_station_id)
  end

end
