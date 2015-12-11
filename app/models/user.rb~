class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :events
  has_many :comments
  has_many :attendings, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendings, foreign_key: "attendee_id" 

  validates :name, presence: true
  
end
