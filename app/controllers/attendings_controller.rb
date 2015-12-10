class AttendingsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    #verify user has not responded to this event before
    @event = Event.find_by(id: params[:event])
    unless user_responded?(@event)
      @attending = current_user.attendings.build
      @attending.attended_event_id = params[:event]
      @attending.going = params[:rsvp]
    end
    redirect_to @event
  end
  
  def update
    @event = Event.find_by(id: params[:event])
    if user_responded?(@event)
      @attending = Attending.where("attendee_id = ? AND attended_event_id = ?",
        current_user.id, @event.id).first
      @attending.update_attributes( going: params[:rsvp])
    end
    redirect_to @event
  end
  
  
 
  
    
end
