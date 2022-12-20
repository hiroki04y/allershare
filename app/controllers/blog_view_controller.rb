class BlogViewController < ApplicationController
    def blog_view
        @blogs = Blog.all
    end
    def blog_show
        @blog = Blog.find_by(id: params[:id])
    end
    def blog_new
    end
    def blog_create
        @blog = Blog.create(title: params[:title], content: params[:content], image: "blog_default.png")
        redirect_to("/blog_view")
    end
    def blog_edit
        @blog = Blog.find_by(id: params[:id])
    end
    def blog_update
        @blog = Blog.find_by(id: params[:id])
        @blog.title = params[:title]
        @blog.content = params[:content]
        @blog.save
        redirect_to("/blog_view")
    end
    def blog_destroy
        @blog = Blog.find_by(id: params[:id])
        @blog.destroy    
        redirect_to("/blog_view")
    end
end
