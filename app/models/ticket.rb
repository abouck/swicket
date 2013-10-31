class Ticket
  include Mongoid::Document
  include HTTParty

  field :section, type: String
  field :row, type: String
  field :seat, type: String
  
  belongs_to :event
  belongs_to :poster, class_name:"User", inverse_of: :posts
  belongs_to :claimant, class_name:"User", inverse_of: :claims

end