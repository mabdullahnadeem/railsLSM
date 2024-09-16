class ExamsController < ApplicationController
  before_action :course_find_by_id
  def show
    @exam = current_user.courses.find_by(id: exam_params).exam
    @exam_question_ids = @exam.questions.ids
    @answer_by_user_to_questions = Answer.where(question_id: @exam_question_ids, user_id: current_user.id)
  end

  def create
    unless @course.exam.present?
      @exam = Exam.create(course_id: @course.id, exam_name: @course.name,
                          user_id: current_user.id)
    end
    @question = @course.exam.questions.new(title: question_params)
    if @question&.save
      redirect_to new_course_exam_path
    else
      redirect_to root_path
    end
  end

  def new
    @exam = Exam.create(course_id: @course.id, exam_name: @course.name) unless @course.exam.present?
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
