class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy]
  
  def index
    @upcoming = Event.where("date >= ?", Time.now).order("date")
    @past = Event.where("date < ?", Time.now).order("date")
  end
  
  def new
    @event = current_user.events.build
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      #have the host invite themselves so they can access
      #the event if it is private
      invitation = @event.invitations.build
      invitation.inviter_id = current_user.id
      invitation.invitee_id = current_user.id
      invitation.save
      redirect_to events_path
    else
      render 'new'
    end
  end
  
  def show
    @event = Event.find_by(id: params[:id])
    permitted_user(@event) if @event.private
    @comment = Comment.new
    @responded = user_responded?(@event)
    @going = user_going?(@event)
    @attendees = event_attendees(@event)
    @invitees = not_responded(@event)
  end
  
  def edit
    @event = Event.find_by(id: params[:id])
    authorize_user(@event)
  end
  
  def update
    @event = Event.find_by(id:params[:id])
    authorize_user(@event)
    @event.update_attributes(event_params)
    if @event.save
      redirect_to @event
    else
      render 'edit'
    end
  end
  
  def destroy
    Event.find_by(id: params[:id]).destroy
    redirect_to events_path
  end
  
  
  private
  
    def event_params
      params.require(:event).permit(:title, :date, :start, :end, :location, :description, :private)
    end
    
    def authorize_user(event)
      redirect_to events_path unless current_user == event.user
    end
    
    def event_attendees(event)
      yeses = Attending.where("attended_event_id = ? AND going = ?", event.id, true)
      ids = yeses.map { |yes| yes.attendee_id }
      attendees = User.where(id: ids)
    end
    
    
end
