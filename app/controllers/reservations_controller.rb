class ReservationsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @reservations = Reservation.where(user_id: current_user.id)
    end
    
    def new
        @room = Room.find(params[:id])
        @user_id = current_user.id
        @user =User.find(params[:id])
        @reservation = Reservation.new
    end
    
    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            flash[:notice] = "予約が完了しました"
            redirect_to reservation_path(@reservation.id)
        else
            render :new
        end
    end
    
    def show
        @reservation = Reservation.find(params[:id])
    end
    
    private
    
    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :room_id).merge(user_id: current_user.id)
    end
end
