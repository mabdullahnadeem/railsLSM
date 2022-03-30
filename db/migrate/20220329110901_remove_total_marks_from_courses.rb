class RemoveTotalMarksFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :total_marks, :float
  end
end
