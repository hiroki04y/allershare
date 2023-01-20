class ChatController < ApplicationController
    def chat
        if params[:cat1] != nil
            @id = 1
        else
            @id = 2
        end
        @room = Chatroom.all
        @user = User.all
        @top = ChatMessage.where('room LIKE(?)', "0")
        if @current_user != nil
            @following_users = @current_user.following_user
        end
    end
end
