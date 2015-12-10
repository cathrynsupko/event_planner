module AttendingsHelper
  
  def user_responded?(event)
    Attending.where("attendee_id = ? AND attended_event_id = ?", 
                   current_user.id, event.id).any?
  end
      
  def user_going?(event)
    Attending.where("attendee_id = ? AND attended_event_id = ? AND going = ?", 
                   current_user.id, event.id, true).any?
  end
  
end
