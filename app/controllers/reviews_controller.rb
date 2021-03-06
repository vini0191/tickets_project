class ReviewsController < ApplicationController
  before_action :set_trade, only: %i[new create]

  def index
    @reviews = Review.where(user: current_user)
  end

  def new
    @page_name = 'Add a reivew'
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.trade = @trade
    @review.user = current_user
    if @review.save
      redirect_to event_path(@trade.ticket.event)
    else
      render 'new'
    end
  end

  def edit
  end

  private

  def review_params
    params[:review][:rate] = params[:review][:rate].to_i + 1
    params.require(:review).permit(:description, :rate)
  end

  def set_trade
    @trade = Trade.find(params[:trade_id])
  end
end
