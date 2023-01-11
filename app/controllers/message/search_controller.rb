class Message::SearchController < ApplicationController
    def index
        if(params[:id] == "1")
            @room = Chatroom.where('roomname LIKE(?)', "%#{params[:roomname]}%")
            respond_to do |format| # リクエスト形式によって処理を切り分ける
                format.html  # html形式の場合
                format.json { render json: @room } # json形式の場合
            end
        else
            @following_users = Relationship.joins('LEFT JOIN users ON relationships.followed_id = users.id or relationships.follower_id = users.id').select('users.id,name, image_name').where('follower_id = ? or followed_id = ?', "#{params[:user]}", "#{params[:user]}").distinct
            respond_to do |format| # リクエスト形式によって処理を切り分ける
                format.html  # html形式の場合
                format.json { render json: @following_users } # json形式の場合
            end
        end
    end
end
