# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  images          :text
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :images
  

	before_save { |user| user.email = email.downcase } 

	validates :name, presence: true, length: { maximum: 50 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  VALID_IMAGES_REGEX = /\S*.com\S*,/i  
  validates :images, presence: true, format: { with: VALID_IMAGES_REGEX }
  has_secure_password
  
  def image_array
  	self.images.split(",")
  end 
  
end