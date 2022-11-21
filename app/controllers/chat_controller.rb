class ChatController < ApplicationController
    def chat
        @room = Chatroom.all
    end
end
