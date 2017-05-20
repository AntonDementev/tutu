class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /trains
  def index
    @tickets = Ticket.all
  end

  # GET /trains/1
  def show
  end

  # GET /trains/new
  def new
    @ticket = Ticket.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Билет был успешно создан.'
    else
      render :new
    end
  end

  # PATCH/PUT /trains/1
  def update
    if @ticket.update(train_params)
      redirect_to @ticket, notice: 'Билет был успешно обновлён.'
    else
      render :edit
    end

  end

  # DELETE /trains/1
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
      #params.require(:ticket).permit()
    end
end
