class QuestionnairesController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  
  def index
    @questionnaires = Questionnaire.all
  end
  
  def new
    @questionnaire = Questionnaire.new
  end
  
  def create
    @questionnaire = current_user.questionnaires.build(questionnaire_params)
    if @questionnaire.save
      flash[:success] = "アンケートが投稿されました!"
      redirect_to questionnaires_path
    else
      flash.now[:danger] = "アンケートの投稿に失敗しました。"
      render 'questionnaires/new'
    end
  end
  
  def delete
    @questionnaire = Questionnaire.find_by(:id => params[:id])
    if current_user.id == @questionnaire.user_id || current_user.admin?
      @questionnaire.destroy
      flash[:success] = "削除しました。"
      redirect_to questionnaires_path
    else
      flash[:danger] = "人のは削除できませんよ。"
      redirect_to questionnaires_path
    end
      
      
  end
  
  private

    def questionnaire_params
      params.require(:questionnaire).permit(:content)
    end
    
end
