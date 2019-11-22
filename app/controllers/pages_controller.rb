class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @page_name = 'Find the perfect event'
    @events_recent = Event.all.order('created_at DESC').take(9)
    @events_diff = (Event.all - @events_recent).first(12)
  end

  def user_profile
    @user = User.find(params[:id])
    @page_name = "#{@user.name.split(' ').first}'s profile"
    @trades = @user.trades
    trades_with_review = @trades.select { |trade| trade.review.present? }
    total_rate = 0
    trades_with_review.each do |trade|
      total_rate += trade.review.rate
    end
    @avarage_rate = total_rate.zero? ? 0 : (total_rate.to_f / trades_with_review.count).round(1)
    # raise
  end
end
