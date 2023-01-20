class UsersController < ApplicationController
    # ログインしている場合の処理
    before_action :forbid_login_user, {only:[:signup,:create,:login_form,:login]}
    before_action :ensure_current_user, {only: [:edit]}
    def ensure_current_user
        if @current_user.id != params[:id].to_i
            redirect_to("/users/#{params[:id]}")
        end
    end


    def signup
        @user = User.new
    end

    def show
        @user = User.find_by(id: params[:id])
        @tag = Usertag.joins(:tag).select('tagname').where('user_id = ?', params[:id]).pluck(:tagname)
        @blogs = Blog.where(UserID: params[:id])
        @tags = BlogTagRelation.joins(:blog_tag).select('*').all
    end

    def login
        # 入力内容と一致するユーザーを取得し、変数@userに代入
        @user = User.find_by(email: params[:email], password: params[:password])
        # @userが存在するかどうかを判定するif
        if @user
            cookies.encrypted[:user_id] = {
                value: @user.id,
                expires: 100.day.from_now
              }
              redirect_to("/")
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
        redirect_to("/login")
    end

    def index
        @user = User.all
    end


    def create
        @user = User.new(name: params[:name], email: params[:email], password: params[:password], image_name:"default_image.jpg")
        if @user.save
          cookies.encrypted[:user_id] = {
            value: @user.id,
            expires: 100.day.from_now
          }
          flash[:notice] = "アカウントを作成しました"
          redirect_to("/users/#{@user.id}")
        else
            @error_message = "値が入力されていない箇所があります"
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
        @user.introduction = params[:introduction]
        @user.memo = params[:memo]

        if @user.save
            str = params[:sendtags]
            if str != nil
                tag = str.split(",")
                for st in tag do
                    @find_tag = Usertag.find_by(user_id: params[:id], tag_id: st.to_i)
                    if @find_tag == nil
                        @tag = Usertag.create(user_id: params[:id], tag_id: st.to_i)
                    else
                        @tag = Usertag.find_by(user_id: params[:id], tag_id: st.to_i)
                        @tag.destroy
                    end
                end
            end
            redirect_to("/users/#{@user.id}")
        else
            redirect_to("/users/#{@user.id}")
        end
    end

    def imagechange
        @user = User.find_by(id: params[:id])
        if params[:image]
            @user.image_name = "#{@user.id}.jpg"
            image = params[:image]
            File.binwrite("public/user_images/#{@user.image_name}", image.read)
            @user.save
        end
    end

    def passchange
        @user = User.find_by(id: params[:id])
        if @user.password == params[:nowpass]
            if params[:pass1] == params[:pass2]
                @user.password = params[:pass1]
                @user.save
                flash[:notice] = "パスワードを編集しました"
                redirect_to("/users/#{@user.id}")
            end
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        @tag = Usertag.joins(:tag).select('tagname').where('user_id = ?', params[:id]).pluck(:tagname)
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
