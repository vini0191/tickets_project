class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @events_recent = Event.all.order('created_at DESC').take(9)
    @events_diff = (Event.all - @events_recent).first(12)
  end

  def user_profile
    @user = User.find(params[:id])
  end
end
