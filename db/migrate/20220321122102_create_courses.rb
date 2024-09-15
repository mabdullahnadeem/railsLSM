# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
