class Message::SearchController < ApplicationController
    def index
        if(params[:id] == "1")
            @room = Chatroom.where('roomname LIKE(?)', "%#{params[:roomname]}%")
            respond_to do |format| # リクエスト形式によって処理を切り分ける
                format.html  # html形式の場合
                format.json { render json: @room } # json形式の場合
            end
        else
            @room = User.where('name LIKE(?)', "%#{params[:roomname]}%")
            respond_to do |format| # リクエスト形式によって処理を切り分ける
                format.html  # html形式の場合
                format.json { render json: @room } # json形式の場合
            end
        end
    end
end
