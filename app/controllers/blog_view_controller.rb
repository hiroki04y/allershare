class BlogViewController < ApplicationController
    def blog_view
        @titles = Blog.all
    end
    def blog_show
        @blog = Blog.find_by(id: params[:id])
    end
end
