# == Schema Information
#
# Table name: emails
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  message        :string(255)
#  email          :string(255)
#  event_type     :string(255)
#  event_location :string(255)
#  date           :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Email < ActiveRecord::Base
  attr_accessible :date, :email, :event_location, :event_type, :message, :name
	validates :date, :email, :event_location, :event_type, :message, :name, { presence: true }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
