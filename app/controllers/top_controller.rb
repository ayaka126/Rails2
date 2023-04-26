class TopController < ApplicationController

    def index
        @user = current_user
        @q = Room.ransack(params[:q])
        @rooms = @q.result(distinct: true)
    end

end
