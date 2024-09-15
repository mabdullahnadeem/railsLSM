# frozen_string_literal: true

class AddQuestionsToExam < ActiveRecord::Migration[5.2]
  def change
    add_reference :exams, :questions, foreign_key: true
  end
end
