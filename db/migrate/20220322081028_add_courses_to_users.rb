# frozen_string_literal: true

class AddCoursesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :courses, foreign_key: true
  end
end
