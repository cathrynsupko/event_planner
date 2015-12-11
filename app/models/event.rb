class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :attendings, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendings, foreign_key: "attended_event_id"
  has_many :invitations
  has_many :invitees, through: :invitations
  validates :user_id, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
