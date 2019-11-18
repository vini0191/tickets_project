class EventsController < ApplicationController
  before_action :set_event, only: %i[show destroy]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start_time, :location, :category)
  end
end
