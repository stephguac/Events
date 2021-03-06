class Event < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :joins
	validates :name, :date, :location, :state, presence: true

end
