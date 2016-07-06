class NewsController < ApplicationController
  before_action :admin_user,     only: :delete
  
  def index
    @user = current_user
    @news = News.all
  end
  
  def new
    @news = News.new
  end
  
  def create
    @news = News.new
    @news.title = params[:news][:title]
    @news.content = params[:news][:content]
    @news.save
    redirect_to news_path
  end
  
  def delete
    @news = News.find_by(:id => params[:id])
    @news.destroy
    flash[:success] = "削除しました。"
      redirect_to news_path
  end
  
end
