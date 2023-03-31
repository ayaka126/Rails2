class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @users = User.all
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
      @room = Room.find_by(params[:id])
      render "rooms/show"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "投稿を更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to :users
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :user_id, :img)
  end
end
