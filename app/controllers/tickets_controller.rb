class TicketsController < ApplicationController
  
  def show
    @ticket = Ticket.find(params[:id])
    @event = Event.find(params[:event_id])
  end

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @event = Event.find(params[:event_id])
  end

  def create
    @ticket = Ticket.new(params[:ticket].permit(:section, :row, :seat))
    @ticket.event = Event.find(params[:event_id])
    @ticket.poster = current_user
    @ticket.save
    redirect_to event_url(params[:event_id])
  end

  def destroy
    Ticket.find(params[:id]).destroy
    redirect_to user_url(current_user.id)
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @event = Event.find(params[:event_id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @event = Event.find(params[:event_id])

    if @ticket.update_attributes(params[:ticket].permit(:section, :row, :seat))
      redirect_to user_url(current_user.id)
    else
      render 'edit'
    end
  end

  def claim
    redirect_to user_url(current_user.id)
  end
end