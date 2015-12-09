class AddGoingToAttending < ActiveRecord::Migration
  def change
    add_column :attendings, :going, :boolean
  end
end
