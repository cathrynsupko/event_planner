class AttendingsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    #verify user has not responded to this event before
    @event = Event.find_by(id: params[:event])
    unless current_user.attended_events.find_by(id: params[:event])
      @attending = current_user.attendings.build
      @attending.attended_event_id = params[:event]
      @attending.going = params[:rsvp]
      if @attending.save
        respond_to do |format|
          format.js
          format.html { redirect_to @event }
        end
      else
        redirect_to @event
      end
    else 
      redirect_to @event
    end
  end
  
  def update
    @event = Event.find_by(id: params[:event])
    if current_user.attended_events.find_by(id: params[:event])
      @attending = Attending.find_by(attendee_id: current_user.id)
      @attending.update_attributes( going: params[:rsvp])
      if @attending.save
        redirect_to @event
      else
        redirect_to @event
      end
    else
      redirect_to @event
    end
  end
end
