class UsersController < ApplicationController
    def signup
        @user = User.new
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def login
    end

    def blog
    end

    def create
        @user = User.new(name: params[:name], email: params[:email], password: params[:password])
        if @user.save
          flash[:notice] = "ユーザー登録が完了しました"
          redirect_to("/users/#{@user.id}")
        else
            render :signup,status: :unprocessable_entity
        end
    end
    
end
