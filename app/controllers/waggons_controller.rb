class WaggonsController < ApplicationController
  before_action :set_waggon, only: [:show, :edit, :update, :destroy]

  
  def index
    @waggons = Waggon.all
  end

  
  def show
  end

  def new
    @waggon = Waggon.new
  end

  def edit
  end

  def create
    @waggon = Waggon.new(waggon_params)

    if @waggon.save
      redirect_to waggon_path(@waggon), notice: 'Вагон был успешно создан.'
    else
      render :new
    end       
  end


  def update
    if @waggon.update(waggon_params)
      redirect_to waggon_path(@waggon), notice: 'Вагон был успешно обновлён.'
    else
      render :edit
    end
  end


  def destroy
    @waggon.destroy
    redirect_to waggons_url, notice: 'Вагон был успешно удалён.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waggon
      @waggon = Waggon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waggon_params
      params.require(:waggon).permit(:train_id, :type, :top_places, :bottom_places, :top_side_places, :bottom_side_places, :seats_places)
    end
    

end
