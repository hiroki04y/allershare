class Message::SearchController < ApplicationController
    def index
        @room = ChatMessage.joins(:user).select('content, room, user_id, name, image_name').where('room LIKE(?)', "%#{params[:room]}%")
        respond_to do |format| # リクエスト形式によって処理を切り分ける
            format.html  # html形式の場合
            format.json { render json: @room } # json形式の場合
        end
    end
end
