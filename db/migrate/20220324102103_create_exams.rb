# frozen_string_literal: true

class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.references :course, foreign_key: true
      t.string :exam_name

      t.timestamps
    end
  end
end
