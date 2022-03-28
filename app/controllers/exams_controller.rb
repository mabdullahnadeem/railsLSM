class ExamsController < ApplicationController
  def show
    @course = Course.find_by(id: params[:course_id])
    @exam = @course.exam
  end

  def create
    @course = Course.find_by(exam_params)
    @question = @course.exam.questions.new(title: question_params)
    if @question.save
      redirect_to new_course_exam_path
    else
      redirect_to new_course_exam_path
    end
  end

  def new
    @course = Course.find_by(exam_params)
    @questions = @course.exam.questions
  end

  private

  def exam_params
    params.require(:course_id)
  end

  def question_params
    params.require(:question).require(:title)
  end
end
