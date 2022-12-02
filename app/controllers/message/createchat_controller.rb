class Message::CreatechatController < ApplicationController
    def index
        @message = ChatMessage.new(content: params[:text], room: params[:room], user_id: params[:user])
        @message.save
        @chat = ChatMessage.joins(:user).select('content, room, user_id, name, image_name').where('room LIKE(?)', "%#{params[:room]}%")
        respond_to do |format| # リクエスト形式によって処理を切り分ける
            format.html  # html形式の場合
            format.json { render json: @chat } # json形式の場合
        end
    end
end