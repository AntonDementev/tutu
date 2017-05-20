class WaggonsController < ApplicationController
  before_action :set_waggon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  
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
    @waggon = @train.waggons.new(waggon_params)

    if @waggon.save
      redirect_to @train, notice: 'Вагон был успешно создан.'
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
    redirect_to @waggon.train, notice: 'Вагон был успешно удалён.'
  end

  private
    def set_train
      @train = Train.find(params[:train_id])
      
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_waggon
      @waggon = Waggon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waggon_params
      params.require(:waggon).permit(:train_id, :type, :top_places, :bottom_places, :top_side_places, :bottom_side_places, :seats_places)
    end
    

end
