class ApplicationController < ActionController::Base
    before_action:set_current_user

    # ログインしている共通のユーザを宣言
    def set_current_user
        @current_user = User.find_by(id: cookies[:user_id])
    end

    # ログインしている場合の処理
    def forbid_login_user
        if @current_user
            flash[:notice] = "すでにログインしています"
            redirect_to("/users/#{@current_user.id}/")
        end
    end
    
end
