class Join < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :user_id, :uniqueness => { :scope => :event_id }

  def self.other_attendees(e_id, cu_id)
	# attendees = Join.where(event_id: params[:id])
  	self.joins(:user).where(event_id: e_id).where.not(user_id: cu_id).select(:first_name, :location, :state)
  end
end