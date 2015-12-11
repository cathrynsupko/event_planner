class Invitation < ActiveRecord::Base
  has_one :invitee, class_name: "User"
  belongs_to :inviter, class_name: "User"
  belongs_to :event
end
