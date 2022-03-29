class DropRoleTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :roles do |t|
      t.string :role, null: false
      t.timestamps
    end
  end
end
