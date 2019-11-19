class TradesController < ApplicationController
  before_action :set_ticket, only: %i[new show]
  before_action :set_event, only: %i[show]

  def show

  end

  private

  def set_event
    @event = set_ticket.event
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
