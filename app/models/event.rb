class Event
	include Mongoid::Document
  include HTTParty

  attr_accessor :response

	field :name, type: String
	field :cat, type: String
	field :size, type: Integer
  field :lat, type: String
  field :lon, type: String
  field :range, type: String
  field :date, type: String

  has_many :tickets

end