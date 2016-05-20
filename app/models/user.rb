class User < ActiveRecord::Base
	has_secure_password
	has_many :events
	has_many :comments, dependent: :destroy
	has_many :events_joined, through: :joins, source: :event
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :email, :location, :state, presence: true
	validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end