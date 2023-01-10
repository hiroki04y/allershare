class ChatController < ApplicationController
    def chat
        @room = Chatroom.all
        @user = User.all
        @top = ChatMessage.where('room LIKE(?)', "0")
        @following_users = @current_user.following_user
    end
end
