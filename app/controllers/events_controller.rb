class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy]
  
  def index
    @events = Event.all
  end
  
  def new
    @event = current_user.events.build
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end
  
  def show
    @event = Event.find_by(id: params[:id])
    @comment = Comment.new
    @responded = user_responded?(@event)
    @going = user_going?(@event)
    @attendees = event_attendees(@event)
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
      params.require(:event).permit(:title, :date, :start, :end, :location, :description)
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
