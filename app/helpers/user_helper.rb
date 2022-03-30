# frozen_string_literal: true

module UserHelper
  def role_of_user(user)
    if user.role_status == 'student'
      "Mr. #{user.name}"
    else
      "Prof. #{user.name}"
    end
  end
end
