class AddTotalMarksToExam < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :total_marks, :float
  end
end
