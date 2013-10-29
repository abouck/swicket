class Ticket
  include Mongoid::Document
  include HTTParty

  field :section, type: String
  field :row, type: String
  field :seat, type: String
  
  belongs_to :event

end