require 'httparty'
require 'json'

class VenuesController < ApplicationController

	def index
		@venues = Venue.all
	end

	def new
		@venue = Venue.new
	end

	def show
		@venue = Venue.find(params[:id])
	end

	def create
		@venue = Venue.create(params[:venue].permit(:name, :cat, :size))
		redirect_to :action => "show", :id => @venue._id
	end

	def destroy
		Venue.find(params[:id]).destroy
		redirect_to venues_url

	end

	def getsearch
		
    @response = HTTParty.get('http://api.seatgeek.com/2/events?lat='+params[:lat]+'&lon='+params[:lon]+'&range='+params[:range]+'km&per_page=24&taxonomies.name=sports')

    render :index
  end

end