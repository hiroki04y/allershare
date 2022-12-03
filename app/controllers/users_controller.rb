class UsersController < ApplicationController
    # ログインしている場合の処理
    before_action :forbid_login_user, {only:[:signup,:create,:login_form,:login]}


    def signup
        @user = User.new
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def login
        # 入力内容と一致するユーザーを取得し、変数@userに代入
        @user = User.find_by(email: params[:email], password: params[:password])
        # @userが存在するかどうかを判定するif
        if @user
            cookies.permanent[:user_id] = @user.id
            flash[:notice] = "ようこそallershareへ"
            redirect_to("/users/index")
        else
            @error_message = "メールアドレスまたはパスワードが間違っています"
            @email = params[:email]
            @password = params[:password]
            render :login_form,status: :unprocessable_entity
        end
    end

    def login_form
    end

    def logout
        cookies.delete :user_id
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
    end

    def index
        @user = User.all
    end


    def create
        @user = User.new(name: params[:name], email: params[:email], password: params[:password], image_name:"default_image.jpg")
        if @user.save
          cookies.permanent[:user_id] = @user.id
          flash[:notice] = "アカウントを作成しました"
          redirect_to("/users/#{@user.id}")
        else
            @name = params[:name]
            @email = params[:email]
            @password = params[:password]
            render :signup,status: :unprocessable_entity
        end
    end

    def change
        @user = User.find_by(id: params[:id])
        @user.name = params[:name]
        @user.email = params[:email]

        if @user.save
            flash[:notice] = "アカウント情報を編集しました"
            redirect_to("/users/#{@user.id}")
        else
            redirect_to("/users/#{@user.id}")
        end
    end

    def imagechange
        if params[:image]
            @user.image_name = "#{@user.id}.jpg"
            image = params[:image]
            File.binwrite("public/user_images/#{@user.image_name}", image.read)
            @user.save
            redirect_to("/users/#{@user.id}")
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def destroy
        chats = ChatMessage.where("user_id = ?", "#{params[:id]}")
        chats.each do |chat|
            chat.destroy
        end
        if User.find(params[:id]).image_name != "default_image.jpg"
            File.delete("public/user_images/#{params[:id]}.jpg")
        end
        cookies.delete :user_id
        User.find(params[:id]).destroy
        flash[:notice] = "アカウントを削除しました"
        redirect_to("/login")
    end

    def follows
        user = User.find(params[:id])
        @users = user.following_user.page(params[:page]).per(3).reverse_order
    end
      
    def followers
        user = User.find(params[:id])
        @users = user.follower_user.page(params[:page]).per(3).reverse_order
    end
    
end
