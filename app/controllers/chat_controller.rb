class ChatController < ApplicationController
    def chat
        @room = Chatroom.all
        @user = User.all
    end
end
