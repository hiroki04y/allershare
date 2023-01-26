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
    @report = Report.new(blog_id: params[:id], title: params[:title], report: params[:report],repotype: params[:type])
    if @report.save
      if params[:type] == "1"
        flash[:notice] = "通報しました"
        redirect_to("/blog/#{params[:id]}")
      elsif params[:type] == "2"
        flash[:notice] = "通報しました"
        redirect_to("/users/#{params[:id]}")
      else
        redirect_to(chat_path(cat1:1))
      end
    end
  end

  def reportview
    @reports = Report.all
  end

  def chatroominsert
  end

  def acountreport
    @user = User.find_by(id:params[:id])
  end
end
