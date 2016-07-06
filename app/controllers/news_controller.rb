class NewsController < ApplicationController
  before_action :admin_user,     only: :delete
  
  def index
    @user = current_user
    @news = News.all
  end
  
  def delete
    @news = News.find_by(:id => params[:id])
    @news.destroy
    flash[:success] = "削除しました。"
      redirect_to news_path
  end
  
end
