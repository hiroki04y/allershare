class ChatController < ApplicationController
    def chat
        @user = User.all
    end
end
