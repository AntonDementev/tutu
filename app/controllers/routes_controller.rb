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

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Маршрут был успешно создан.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: 'Маршрут был успешно обновлён.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to routes_url, notice: 'Маршрут был успешно удалён.' }
    end
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
