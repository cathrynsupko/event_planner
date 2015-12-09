class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create]
  
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
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :date, :start, :end, :location, :description)
    end
end
