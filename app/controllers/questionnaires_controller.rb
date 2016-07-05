class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all
  end
  
  def create
  end
  
  def delete
    @questionnaire = Questionnaire.find_by(:id => params[:id])
  end
  
end
