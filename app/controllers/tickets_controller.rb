class TicketsController < ApplicationController
  before_action :set_ticket, except: %i[index new create]
  # before_action :set_ticket, only: %i[show edit update destroy]
  before_action :set_event, except: %i[index destroy show]
  # before_action :set_event, only: %i[new create edit show update]

  def index
    @page_name = 'Tickets'
    @tickets = Ticket.all
  end

  def show
    @page_name = @ticket.event.title
  end

  def new
    @page_name = 'Register a ticket'
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.event = @event
    if @ticket.save
      redirect_to event_path(@ticket.event)
    else
      render :new
    end
  end

  def edit
    @page_name = 'Edit your ticket'
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
    price = (params[:ticket][:price].split(' ')[1].to_f * 100).to_i
    params[:ticket][:price] = price
    params.require(:ticket).permit(:price, :seat, :area)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
