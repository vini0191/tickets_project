class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
    raise
    redirect_to tickets_path
  end

  def edit
  end

  def update
    @ticket.update(ticket_params)
    redirect_to tickets_path
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:price, :seat, :type)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
