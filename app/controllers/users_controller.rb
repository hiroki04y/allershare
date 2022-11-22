class UsersController < ApplicationController
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
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました"
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
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
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

    def change
        @user = User.find_by(id: params[:id])
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]

        if params[:image]
            @user.image_name = "#{@user.id}.jpg"
            image = params[:image]
            File.binwrite("public/user_images/#{@user.image_name}", image.read)
        end

        if @user.save
            flash[:notice] = "ユーザー情報を編集しました"
            redirect_to("/users/#{@user.id}")
        else
            render :edit,status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
    end


    def destroy
        if User.find(params[:id]).image_name != "default_image.png"
            File.delete("public/user_images/#{params[:id]}.jpg")
        end
        User.find(params[:id]).destroy
        flash[:notice] = "ユーザを削除しました"
        redirect_to("/login")
    end
    
end
