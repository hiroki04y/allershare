class BlogViewController < ApplicationController
    def blog_view
        if params[:cat1] != nil
            if params[:cat1] == "2"
                @cat1 = "人気のブログ"
                @blogs = Blog.all
            elsif params[:cat1] == "3"
                @cat1 = "新着ブログ"
                @blogs = Blog.all.order(id: "DESC")
            else
                @cat1 = params[:cat1]
                @blogs = Blog.all
            end
        else
            str = params[:sendtags]
            blogtag = str.split(",")
            @blogs = BlogTagRelation.joins(:blog).select('title,image,blogs.id').distinct.where("blog_tag_id IN (?)",blogtag)
            @count = BlogTagRelation.joins(:blog).select('title,image,blogs.id').distinct.where("blog_tag_id IN (?)",blogtag).length
            @cat2 = BlogTag.where("id IN (?)",blogtag)
        end
        @tags = BlogTagRelation.joins(:blog_tag).select('*').all
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
            blogstr = SecureRandom.alphanumeric(15)
            @blog.image = "#{blogstr}.jpg"
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
            BlogTagRelation.create(blog_id:@blog.id.to_i, blog_tag_id: st.to_i)
            end
            redirect_to("/blog_view/2")
        end
    end

    def blog_edit
        @blog = Blog.find_by(id: params[:id])
        @blogtags = BlogTagRelation.where('blog_id = ?', params[:id])
    end

    def blog_update
        @blog = Blog.find_by(id: params[:id])
        @blog.title = params[:title]
        @blog.content = params[:content]
        if params[:image]
            if @blog.image != "blog_default.png"
                @blog.image = "#{@blog.image}.jpg"
            else
                blogstr = SecureRandom.alphanumeric(15)
                @blog.image = "#{blogstr}.jpg"
            end
            image = params[:image]
            File.binwrite("public/blog_images/#{@blog.image}", image.read)
        end
        if @blog.save
            str = params[:sendtags]
            if str != nil
                tag = str.split(",")
                for st in tag do
                    @find_tag = BlogTagRelation.find_by(blog_id: params[:id].to_i, blog_tag_id: st.to_i)
                    if @find_tag == nil
                        @tag = BlogTagRelation.create(blog_id: params[:id].to_i, blog_tag_id: st.to_i)
                    else
                        @tag = BlogTagRelation.find_by(blog_id: params[:id].to_i, blog_tag_id: st.to_i)
                        @tag.destroy
                    end
                end
            end
            flash[:notice] = "投稿を編集しました"
            redirect_to("/blog_view/2")
        else
            render("/blog_view/blog_edit")
        end
    end

    def blog_destroy
        @blog = Blog.find_by(id: params[:id])
        if @blog.image != "blog_default.png"
            File.delete("public/blog_images/#{@blog.image}")
        end
        @blog.destroy
        flash[:notice] = "投稿を削除しました"    
        redirect_to("/blog_view/2")
    end
end
