class EventsController < ApplicationController
  before_action :set_event, only: %i[show destroy]

  def index
    @events = Event.all
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
