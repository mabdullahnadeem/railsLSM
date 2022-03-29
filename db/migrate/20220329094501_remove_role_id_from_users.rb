class RemoveRoleIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :role_id, foreign_key: true
  end
end
