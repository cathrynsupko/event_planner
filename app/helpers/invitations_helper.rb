module InvitationsHelper
  
  def invitees(event)
    invitations = event.invitations
    ids = invitations.map { |i| i.invitee_id }
    invitees = User.where(id: ids)
  end
  
  def user_invited?(event)
    return false unless current_user
    invitees(event).include?(current_user)
  end
    
  def user_attending?(event)
    return false unless current_user
    event.attendees.include?(current_user)
  end
    
  def permitted_user(event)
    unless user_invited?(event) || user_attending?(event)
      flash[:notice] = "Sorry! The event you are trying to access is private."
      redirect_to events_path
    end
  end
  
  def user_invitations(user)
    return nil if user.nil?
    invites = Invitation.where("invitee_id = ?", user.id)
    events = invites.map { |i| i.event }
  end
  
  def not_invited(event)
    users = User.all
    n = []
    users.each do |user|
      unless invitees(event).include?(user) || event.attendees.include?(user)
        n << user
      end
    end
    n
  end
  
  def not_responded(event)
    n = []
    invitees(event).each do |user|
      unless event.attendees.include?(user)
        n << user
      end
    end
    n
  end

end
