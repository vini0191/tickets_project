class EventsController < ApplicationController
  before_action :set_event, only: %i[show destroy]

  def new
    @event = Event.new
  end

  def index
    if params[:search].present?
      location_results = params[:search][:location].empty? ? '' : params[:search][:location]
      date_results = params[:search][:date].empty? ? '' : params[:search][:date]
      title_results = params[:search][:title].empty? ? '' : params[:search][:title]
      # results
      @events = Event.where("lower(location) = ?", location.downcase)
                     .page(params[:page]).per(18)
    else
      @events = []
    end
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
    params.require(:event).permit(:title, :start_time, :location, :category, :photo)
  end
end
