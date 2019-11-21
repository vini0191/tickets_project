class TradesController < ApplicationController
  # before_action :set_ticket, only: %i[new show create]
  # before_action :set_event, only: %i[show]

  def show
    # raise
    @trade = Trade.find(params[:id])
    @ticket = @trade.ticket
    @event = @ticket.event
    @page_name = "Tickets of #{@event.title}"
  end

  def new
    set_ticket
  end

  def create
    @trade = Trade.new
    @trade.ticket = set_ticket
    @trade.user = current_user
    if @trade.save
      redirect_to trade_path(@trade)
    else
      render :show
    end
  end

  private

  def set_event
    @event = set_ticket.event
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def trade_params
    # params.require(:trades).permit
  end
end
