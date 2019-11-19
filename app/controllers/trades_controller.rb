class TradesController < ApplicationController
  before_action :set_ticket, only: %i[new show create]
  before_action :set_event, only: %i[show]

  def show
    # raise
  end

  def create
    @trade = Trade.new
    @trade.ticket = @ticket
    @trade.user = current_user
    if @trade.save
      redirect_to ticket_path(@ticket)
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
