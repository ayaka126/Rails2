class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:mypage]

  def mypage
    redirect_to user_path(current_user)
  end

  def index
    @users = User.all
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def show
    @user = current_user.id
    @room = Room.find(params[:id])
  end
end
