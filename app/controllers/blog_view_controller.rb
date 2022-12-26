class BlogViewController < ApplicationController
    def blog_view
        @blogs = Blog.all
    end
    def blog_show
        @blog = Blog.find_by(id: params[:id])
    end
    def blog_new
        @blog = Blog.new
    end
    def blog_create
        @blog = Blog.create(title: params[:title], content: params[:content])
        if params[:image]
            @blog.image = "#{@blog.id}.jpg"
            image = params[:image]
            File.binwrite("public/blog_images/#{@blog.image}", image.read)
        else
            @blog.image = "blog_default.png"
        end
        if @blog.save
            flash[:notice] = "投稿を作成しました"
            redirect_to("/blog_view")
        else
            render("/blog_view/blog_new")
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
