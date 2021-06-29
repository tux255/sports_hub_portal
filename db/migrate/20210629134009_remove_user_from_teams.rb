class RemoveUserFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_reference :teams, :user, null: false
  end
end
