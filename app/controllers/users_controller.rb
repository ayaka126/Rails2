class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:mypage]

  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
  end
end
