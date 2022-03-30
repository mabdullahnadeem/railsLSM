class ExamsController < ApplicationController
  before_action :course_find_by_id
  def show
    @exam = @course.exam
  end

  def create
    @question = @course.exam.questions.new(title: question_params)
    if @question&.save
      redirect_to new_course_exam_path
    else
      redirect_to root_path
    end
  end

  def new
    @exam = Exam.create(course_id: @course.id, exam_name: @course.name) unless @course.exam.present?
    @course = Course.find_by(id: exam_params) # reassign to get course's exam attribute
    @questions = @course.exam&.questions
  end

  private

  def course_find_by_id
    @course = Course.find_by(id: exam_params)
  end

  def exam_params
    params.require(:course_id)
  end

  def question_params
    params.require(:question).require(:title)
  end
end
