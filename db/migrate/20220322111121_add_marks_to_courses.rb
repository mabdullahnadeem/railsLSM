# frozen_string_literal: true

class AddMarksToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :total_marks, :float
  end
end
