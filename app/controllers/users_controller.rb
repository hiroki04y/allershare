class UsersController < ApplicationController
    def signup
        @user = User.new
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def login
    end

    def index
        @user = User.all
    end


    def create
        @user = User.new(name: params[:name], email: params[:email], password: params[:password], image_name:"default_image.png")
        if @user.save
          flash[:notice] = "ユーザー登録が完了しました"
          redirect_to("/users/#{@user.id}")
        else
            render :signup,status: :unprocessable_entity
        end
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:notice] = "ユーザを削除しました"
        redirect_to("/login")
    end
    
end
