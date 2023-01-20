class HomeController < ApplicationController
  def top
    @blogs = Blog.all.limit(7)
    @blogs2 = Blog.all.order(id: "DESC").limit(7)
    @tags = BlogTagRelation.joins(:blog_tag).select('*').all
    @users = User.all.limit(4)
    @usertags = Usertag.joins(:tag).select('*').all
  end

  def use
    @blogs = Blog.all.limit(7)
    @tags = BlogTagRelation.joins(:blog_tag).select('*').all
  end
end
