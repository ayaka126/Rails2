class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end
  
  def new
    @reservation = Reservation.new
  end

  def back
    @reservation = Reservation.new(@attr)
    render "new"
  end

  def confirm
    @reservation = Reservation.new(@attr)
    if @reservation.invalid?
      render "new"
    end
  end

  def complete
    Reservation.create!(@attr)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice] = "予約を更新しました"
      redirect_to :reservations
    else
      flash.now[:alert] = "予約が更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to :reservations
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :how_many_people, :user_id, :room_id)
  end
end
