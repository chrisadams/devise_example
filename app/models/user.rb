class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable,
	:token_authenticatable, :lockable

	validates :name, :presence => true
	validates_length_of :name,
	:within => 1..40,
	:too_short => ' is too short, must be between 1 and 40 characters',
	:too_long => ' is too long, must be between 1 and 40 characters'

	before_save :ensure_authentication_token

end
