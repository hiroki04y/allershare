class ChatController < ApplicationController
    def chat
        @room = Chatroom.all
        @user = User.all
        @top = ChatMessage.where('room LIKE(?)', "0")
    end
end
