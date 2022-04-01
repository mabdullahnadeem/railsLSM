# frozen_string_literal: true

class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    user_status
  end

  def edit?
    user_status
  end

  private

  def user_status
    @user.role_status == 'teacher'
  end
end
