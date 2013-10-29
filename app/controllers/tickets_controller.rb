class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @event = Event.find(params[:event_id])
  end

  def show
    @ticket = Ticket.find(params[:id])
    @event = Event.find(params[:event_id])
  end

  def create
    @ticket = Ticket.new(params[:ticket].permit(:section, :row, :seat))
    #@ticket.user = current_user
    @ticket.event = Event.find(params[:event_id])
    @ticket.save
    redirect_to :action => "show", :id => @ticket._id
  end

  def destroy
    Ticket.find(params[:id]).destroy
    redirect_to tickets_url
  end
end