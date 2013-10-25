class Venue
	include Mongoid::Document
  include HTTParty

	field :name, type: String
	field :cat, type: String
	field :size, type: Integer
  field :lat, type: String
  field :lon, type: String
  field :range, type: String
  field :date, type: String

  def getevents
  end


end