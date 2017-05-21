class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end


  def show
  end
  
  def buy
    @ticket = Ticket.new
  end


  def new
    @ticket = Ticket.new
  end



  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Ваш билет успешно куплен.'
    else
      render :new
    end
  end



  def destroy
    @ticket.destroy

    redirect_to tickets_url, notice: 'Билет был успешно удалён.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:train_id, :user_id, :first_station_id, :last_station_id, :passanger_name, :passport_data)
    end
end
