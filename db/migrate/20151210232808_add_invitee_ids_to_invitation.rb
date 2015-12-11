class AddInviteeIdsToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :invitee_ids, :integer, array: true, default: '{}'
  end
end
