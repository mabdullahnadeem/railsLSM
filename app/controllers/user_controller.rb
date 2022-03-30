# frozen_string_literal: true

class UserController < ApplicationController
  def index
    authorize current_user
    @users = User.all
  end
end
