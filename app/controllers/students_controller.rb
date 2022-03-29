# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    authorize current_user
    @users = User.all
  end
end
