class HomeController < ApplicationController
  def top
    @blogs = Blog.all.limit(5)
    @blogs2 = Blog.all.order(id: "DESC").limit(5)
    @tags = BlogTagRelation.joins(:blog_tag).select('*').all
    @users = User.all.limit(4)
    @usertags = Usertag.joins(:tag).select('*').all
  end

  def use
    @blogs = Blog.all.limit(7)
    @tags = BlogTagRelation.joins(:blog_tag).select('*').all
  end

  def report
    @blog = Blog.find_by(id:params[:id])
  end

  def addreport
    @report = Report.new(blog_id: params[:id], title: params[:title], report: params[:report])
    if @report.save
      flash[:notice] = "通報しました"
      redirect_to("/blog/#{params[:id]}")
    end
  end
end
