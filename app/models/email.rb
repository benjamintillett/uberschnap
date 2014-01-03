class Email < ActiveRecord::Base
  attr_accessible :date, :email, :event_location, :event_type, :message, :name
	validates :date, :email, :event_location, :event_type, :message, :name, { presence: true }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
