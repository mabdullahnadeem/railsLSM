# frozen_string_literal: true

class CreateUserCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_courses do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
