class Message::Createchat2Controller < ApplicationController
    def index
        @message = Personalchat.new(content: params[:text], send_id: params[:room], user_id: params[:user])
        @message.save
        @chat = Personalchat.joins(:user).select('content, send_id, user_id, name, image_name').where('send_id = ? and user_id = ? or send_id = ? and user_id = ?' , "#{params[:user]}", "#{params[:room]}", "#{params[:room]}", "#{params[:user]}")
        respond_to do |format| # リクエスト形式によって処理を切り分ける
            format.html  # html形式の場合
            format.json { render json: @chat } # json形式の場合
        end
    end
end