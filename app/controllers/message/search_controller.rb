class Message::SearchController < ApplicationController
    def index
        if(params[:id] == "1")
            @room = Chatroom.where('roomname LIKE(?)', "%#{params[:roomname]}%")
            respond_to do |format| # リクエスト形式によって処理を切り分ける
                format.html  # html形式の場合
                format.json { render json: @room } # json形式の場合
            end
        else
            @following_users = Personalchat.joins(:user).select('users.id,name, image_name').where('send_id = ? or user_id = ?', "#{params[:user]}", "#{params[:user]}").distinct
            respond_to do |format| # リクエスト形式によって処理を切り分ける
                format.html  # html形式の場合
                format.json { render json: @following_users } # json形式の場合
            end
        end
    end
end
