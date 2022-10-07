class RoomsController < ApplicationController
    before_action :authenticate_user!, except: [:search]
    
    def index
        @rooms = Room.all
    end
    
    def new
        @room = Room.new
    end
    
    def create
        @room = Room.new(room_params)
        if @room.save
            flash[:notice] = "ルームを登録しました"
            redirect_to :rooms
        else
            flash[:notice] = "ルーム情報に誤りがあります"
            render "new"
        end
    end
    
    private
    
    def room_params
        params.require(:room).permit(:name, :introduction, :price, :address, :image).merge(user_id: current_user.id)
    end
end
