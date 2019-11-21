class EventsController < ApplicationController
  before_action :set_event, only: %i[show destroy]

  def new
    @event = Event.new
  end

  def index
    if params[:search].present?
      @events = Event.where('lower(location) LIKE ?', "%#{params[:search][:location].downcase}%")
                     .where('lower(title) LIKE ?', "%#{params[:search][:title].downcase}%")
                     .page(params[:page]).per(18)
      filter_by_date unless params[:search][:date].empty?
      @events = Kaminari.paginate_array(@events).page(params[:page]).per(18)
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

  def show
    @twitter_text = "Check out this event at"
  end

  private

  def filter_by_date
    date = Date.parse(params[:search][:date])
    @events = @events.select { |event| event.start_time > date.beginning_of_day && event.start_time < date.end_of_day }
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start_time, :location, :category, :photo, :description)
  end
end
