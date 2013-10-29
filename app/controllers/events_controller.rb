require 'httparty'
require 'json'

class EventsController < ApplicationController

	def active
		@events = Event.all
	end

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.create(params[:event].permit(:name, :cat, :size))
		redirect_to :action => "show", :id => @event._id
	end

	def destroy
		Event.find(params[:id]).destroy
		redirect_to events_url

	end

	def getsearch
		
    @response = HTTParty.get('http://api.seatgeek.com/2/events?lat='+params[:lat]+'&lon='+params[:lon]+'&range='+params[:range]+'km&per_page=24&taxonomies.name=sports')

    render :index
  end

end