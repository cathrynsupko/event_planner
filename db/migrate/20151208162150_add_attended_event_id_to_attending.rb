class AddAttendedEventIdToAttending < ActiveRecord::Migration
  def change
    add_column :attendings, :attended_event_id, :integer
  end
end
