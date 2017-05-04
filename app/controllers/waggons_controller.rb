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

    respond_to do |format|
      if @waggon.save
        format.html { redirect_to @waggon, notice: 'Вагон был успешно создан.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @waggon.update(waggon_params)
        format.html { redirect_to @waggon, notice: 'Вагон был успешно обновлён.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @waggon.destroy
    respond_to do |format|
      format.html { redirect_to waggons_url, notice: 'Вагон был успешно удалён.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waggon
      @waggon = Waggon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waggon_params
      params.require(:waggon).permit(:train_id, :category_id, :top_places, :bottom_places)
    end
    

end
