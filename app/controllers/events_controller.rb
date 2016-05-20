class EventsController < ApplicationController
before_action :require_login

  def index
    @events = Event.all
    @events_in_state = Event.where(state: current_user.state)
    @events_elsewhere = Event.where.not(state: current_user.state)
  end

  def create
    new_event = Event.create(event_params)
    if new_event.save
      flash[:message] = "Event added successfully!"
      redirect_to :back
    else
      flash[:message] = new_event.errors.full_messages
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    Event.update(params[:id], event_params)
    redirect_to "/events"
  end

  def destroy
    Event.destroy(params[:id])
  end

  def show
    @attendee_count = Join.where(event_id: params[:id]).count
    @event = Event.find(params[:id])
    @others = Join.other_attendees(params[:id], current_user.id)
    #^this comes out as an array? iterate through in view
    @comments = Comment.where(event_id: params[:id])
  end

  private
    def event_params
    params.require(:event).permit(:user_id, :name, :date, :location, :state)
    end
end