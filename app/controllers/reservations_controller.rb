class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    @room = Room.find(params[:room_id])
  end
  
  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
    @user = current_user

  end

  def back
    @reservation = Reservation.new(@attr)
    render "new"
  end

  def create
    @room = Room.find(params[:room_id])
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to :room_reservations
    else
      flash.now[:alert] = "予約できませんでした"
      render "new"
    end
  end

  def complete
    Reservation.create!(@attr)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @reservation.user_id = current_user.id
    @rooms = @reservation.rooms.includes(:user)
    @room =  Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:room_id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:room_id])
    if @reservation.update(reservation_params)
      flash[:notice] = "予約を更新しました"
      redirect_to :room_reservations
    else
      flash.now[:alert] = "予約が更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find_by(room_id:params[:room_id], user_id:current_user.id)
    @room = @reservation.room
    @reservation.destroy
    flash.now[:notice] = "予約を削除しました"
    redirect_to :reservations
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :how_many_people, :user_id, :room_id)
  end
end
