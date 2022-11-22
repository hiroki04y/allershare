class Message::SendchatController < ApplicationController
    def index
        @chat = ChatMessage.where('room LIKE(?)', "%#{params[:room]}%")
        respond_to do |format| # リクエスト形式によって処理を切り分ける
            format.html  # html形式の場合
            format.json { render json: @chat } # json形式の場合
        end
    end
end