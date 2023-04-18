class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:mypage]

  def mypage
    redirect_to user_path(current_user)
    @user = current_user
    @avatar = @user.avatar
  end

  def index
    @users = User.all
    @rooms = Room.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    @reservations = Reservation.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def show
    @user = current_user
    @avatar = current_user.avatar
    
    
  end


  def updated_at
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :introduction, :avatar)
  end
end
