class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @rooms = Room.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    @user = User.find(current_user.id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "施設を登録しました"
      redirect_to :rooms
    else
      flash.now[:alert] = "施設を登録できませんでした"
      render "new"
    end
  end

  def show
    @reservation = Reservation.new
    @room = Room.find(params[:id])
    @user = User.find(current_user.id)
  end

  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "施設情報を更新しました"
      redirect_to user_url
    else
      flash.now[:alert] = "施設情報を更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash.now[:notice] = "施設を削除しました"
    redirect_to :rooms
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :user_id, :img, :img_cache, :reservation_id)
  end
end
