class Venue
	include Mongoid::Document

	field :name, type: String
	field :cat, type: String
	field :size, type: Integer

end