# frozen_string_literal: true

class UserController < ApplicationController
  def index
    authorize current_user
    @users = User.all
  end

  def edit
    @user = User.find_by(id: user_params)
  end

  def update
    @user = User.find_by(id: user_params)
    if @user.update_attributes(user_updated_params)
      flash[:notice] = 'User Name Updated!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to edit product!'
      render :edit
    end
  end

  private

  def user_params
    params.require(:id)
  end

  def user_updated_params
    params.require(:user).permit(:name)
  end
end
