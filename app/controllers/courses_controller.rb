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
      redirect_to user_courses_path(user_id: current_user.id)
    else
      redirect_to new_user_course_path(user_id: current_user.id)
    end
  end

  def all
    @all_courses = Course.paginate(page: params[:page], per_page: 10)
    @current_user_courses = current_user&.courses
    @courses_user_can_enroll = @all_courses - @current_user_courses
  end

  def new
    authorize @user
  end

  def show
    @course = Course.find(params[:id])
    @exam = @course&.exam
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course_enrollment = @course.user_courses.new(user_id: params[:user_id], course_id: params[:id])
    if @course_enrollment.save
      flash[:notice] = 'Enrolled!'
      redirect_to user_courses_path
    else
      redirect_to 'All Classes'
    end
  end

  def destroy
    UserCourse.where(user_id: current_user.id, course_id: course_params_id).destroy_all
  end

  private

  def user_getter
    @user = current_user
    # @user = User.find(params[:student_id])
  end

  def course_params
    params.require(:course).permit(:name)
  end

  def course_params_id
    params.require(:id)
  end
end
