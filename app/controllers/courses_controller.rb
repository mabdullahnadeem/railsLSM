# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :user_getter, only: %i[index create new]
  def index
    @courses = @user.courses
    redirect_to root_path unless @courses
  end

  def create
    @user.courses.new(course_params)
    if @user.save
      redirect_to student_courses_path
    else
      redirect_to new_student_course_path
    end
  end

  def all_courses
    @courses = Course.all
  end

  def new
    authorize @user
  end

  def show
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course_enrollment = @course.user_courses.new(user_id: params[:student_id], course_id: params[:id])

    if @course_enrollment.save
      redirect_to student_courses_path
    else
      redirect_to 'All Classes'
    end
  end

  private

  def user_getter
    @user = current_user
    # @user = User.find(params[:student_id])
  end

  def course_params
    params.require(:course).permit(:name, :total_marks)
  end
end
