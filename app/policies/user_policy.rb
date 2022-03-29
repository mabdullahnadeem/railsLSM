# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user_role_is_teacher?
  end

  def new?
    user_role_is_teacher?
  end

  private

  def user_role_is_teacher?
    @user.role.role == 'teacher'
  end
end
