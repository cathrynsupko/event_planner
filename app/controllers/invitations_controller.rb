class InvitationsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @event = Event.find(params[:event_id])
    @invitation = Invitation.new
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
