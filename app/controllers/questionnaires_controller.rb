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
      redirect_to questionnaires_path
    end
  end
  
  def delete
    @questionnaire = Questionnaire.find_by(:id => params[:id])
  end
  
  private

    def questionnaire_params
      params.require(:questionnaire).permit(:content)
    end
    
end
