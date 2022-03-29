# frozen_string_literal: true

class AnswersController < ApplicationController
  def new
    @user = User.find_by(user_permit_params)
    @course = @user.courses.find_by(id: course_permit_params)
    @question_answered = @course.exam.questions.find_by(id: question_permit_params)
    @answer = Answer.new(body: answer_permit_params, question_id: @question_answered.id)
    @answer.save
  end

  private

  def user_permit_params
    params.require(:user_id)
  end

  def course_permit_params
    params.require(:course_id)
  end

  def question_permit_params
    params.require(:question_id)
  end

  def answer_permit_params
    params.require(:answer).require(:body)
  end
end
