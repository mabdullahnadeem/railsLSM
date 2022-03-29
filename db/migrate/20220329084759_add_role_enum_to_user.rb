class AddRoleEnumToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role_status, :interger
  end
end
