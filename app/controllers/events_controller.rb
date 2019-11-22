class EventsController < ApplicationController
  before_action :set_event, only: %i[show destroy]

  def new
    @page_name = 'Register an event'
    @event = Event.new
  end

  def index
    @page_name = 'Events'
    if params[:search].present?
      @events = Event.where('lower(location) LIKE ?', "%#{params[:search][:location].downcase}%")
                    .where('lower(title) LIKE ?', "%#{params[:search][:title].downcase}%")
                    .page(params[:page]).per(18)
      filter_by_date unless params[:search][:date].empty?
      @events = Kaminari.paginate_array(@events).page(params[:page]).per(18)
    else
      @events = Event.all.page(params[:page]).per(18)
    end
    # @events = Event.geocoded # returns events with coordinates
    # raise
    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        image_url: helpers.asset_url('logo-yoohood.png')
      }
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
    @page_name = @event.title
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
    params.require(:event).permit(:title, :start_time, :location, :category, :photo)
  end
end
