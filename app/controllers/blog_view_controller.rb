class BlogViewController < ApplicationController
    def blog_view
        @titles = Blog.all
    end
    def blog_show
        @blog = Blog.find_by(id: params[:id])
    end
    def blog_new
    end
    def blog_create
        @blog = Blog.create(title: params[:title], content: params[:content])
        redirect_to("/blog_view")
    end
end
