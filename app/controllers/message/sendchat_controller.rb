class Message::SendchatController < ApplicationController
    def index
        if(params[:id] == "1")
            @chat = ChatMessage.joins(:user).select('content, room, user_id, name, image_name').where('room LIKE(?)', "#{params[:room]}")
            respond_to do |format| # リクエスト形式によって処理を切り分ける
                format.html  # html形式の場合
                format.json { render json: @chat } # json形式の場合
            end
        else
            @chat = Personalchat.joins(:user).select('content, send_id, user_id, name, image_name').where('send_id = ? and user_id = ? or send_id = ? and user_id = ?' , "#{params[:usr]}", "#{params[:pair]}", "#{params[:pair]}", "#{params[:usr]}").order(id: "DESC")
            respond_to do |format| # リクエスト形式によって処理を切り分ける
                format.html  # html形式の場合
                format.json { render json: @chat } # json形式の場合
            end
        end
    end
end