class AddAttendeeIdToAttending < ActiveRecord::Migration
  def change
    add_column :attendings, :attendee_id, :integer
  end
end
