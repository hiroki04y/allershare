class BlogViewController < ApplicationController
    def blog_view
        @blogs = Blog.all
    end

    def blog_show
        @blog = Blog.find_by(id: params[:id])
        @user = User.find_by(id: @blog.UserID)
        @likes_count = Like.where(blog_id: @blog.id).count
    end

    def blog_new
        @blog = Blog.new
        @blogtag = BlogTag.all
    end
    def blog_create
        @blog = Blog.new(title: params[:title], content: params[:content], UserID: @current_user.id)
        if params[:image]
            @blog.image = "#{@blog.id}.jpg"
            image = params[:image]
            File.binwrite("public/blog_images/#{@blog.image}", image.read)
        else
            @blog.image = "blog_default.png"
        end
        if @blog.save
            #blogtag
            str = params[:sendtags]
            blogtag = str.split(",")
            @blog = Blog.find_by(title:params[:title])
            for st in blogtag do
            BlogTagRelation.create(blog_id:@blog.id, blog_tag_id: st.to_i)
            end
            redirect_to("/blog_view")
        end
    end

    def blog_edit
        @blog = Blog.find_by(id: params[:id])
    end

    def blog_update
        @blog = Blog.find_by(id: params[:id])
        @blog.title = params[:title]
        @blog.content = params[:content]
        @blog.image = params[:image]
        if params[:image]
            @blog.image = "#{@blog.id}.jpg"
            image = params[:image]
            File.binwrite("public/blog_images/#{@blog.image}", image.read)
        else
            @blog.image = "blog_default.png"
        end
        if @blog.save
            flash[:notice] = "投稿を編集しました"
            redirect_to("/blog_view")
        else
            render("/blog_view/blog_edit")
        end
    end

    def blog_destroy
        @blog = Blog.find_by(id: params[:id])
        @blog.destroy
        flash[:notice] = "投稿を削除しました"    
        redirect_to("/blog_view")
    end
end
