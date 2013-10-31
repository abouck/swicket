require 'bcrypt'

class User
  include Mongoid::Document

  attr_accessor :password, :password_confirmation

  field :username, type: String
  field :email, type: String
  field :salt, type: String
  field :hashed_password, type: String

  before_save :hash_password
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  has_many :posts, class_name: "Ticket", inverse_of: :poster
  has_many :claims, class_name: "Ticket", inverse_of: :claimant

  def authenticate(password)
    self.hashed_password == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
      password = password_confirmation = nil
    end
  end



end