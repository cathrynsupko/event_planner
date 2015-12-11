class InvitationsController < ApplicationController
  def new
    @event = Event.find(params[:id])
    @invitation = Invitation.new
  end
  
  def index
    @event = Event.find(params[:event_id])
    @ids = params[:values][:user_ids]
    @stuff = User.where(id: @ids)
  end
  
  def create
    @event = Event.find(params[:event_id])
    @ids = params[:values][:user_ids]
    @invitees = User.where(id: @ids)
    @invitees.each do |invitee|
      invitation = @event.invitations.build
      invitation.invitee_id = invitee.id
      invitation.inviter_id = current_user.id
      invitation.save
    end
    redirect_to @event
  end
end
