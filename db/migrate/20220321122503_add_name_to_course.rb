# frozen_string_literal: true

class AddNameToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :name, :string
  end
end
