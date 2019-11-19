class TicketsController < ApplicationController
  before_action :set_ticket, except: %i[index new create]
  # before_action :set_ticket, only: %i[show edit update destroy]
  before_action :set_event, except: %i[index destroy]
  # before_action :set_event, only: %i[new create edit show update]

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
    @ticket.user = current_user
    @ticket.event = @event
    # raise
    if @ticket.save
      redirect_to event_path(@ticket.event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @ticket.update(ticket_params)
    redirect_to event_path(@event)
  end

  def destroy
    @ticket.destroy
    redirect_to events_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:price, :seat, :area)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
