class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  
  def index
    @routes = Route.all
  end

  
  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route, notice: 'Маршрут был успешно создан.'
    else
      render :new
    end
  end


  def update
    if @route.update(route_params)
      redirect_to @route, notice: 'Маршрут был успешно обновлён.'
    else
      render :edit
    end
  end


  def destroy
    @route.destroy
    redirect_to routes_url, notice: 'Маршрут был успешно удалён.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:title)
    end
    

end
