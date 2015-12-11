module InvitationsHelper
  def invitees(event)
    invitations = event.invitations
    ids = invitations.map { |i| i.invitee_id }
    invitees = User.where(id: ids)
  end
end
