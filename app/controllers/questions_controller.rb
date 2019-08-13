class QuestionsController < ApplicationController
  before_action :load_object, only: %w(update show destroy)
  before_action :question_params, only: :update

  def create
    @question = GenerateForm.new(params).question
  end

  # def answer
  #   @question = GenerateForm.new(params).question
  # end

  def show
  end
  
  def update    
    @question.update(question_params)
  end

  def destroy
    @question_id = @question.id
    @question.destroy
  end
  
  private

  def load_object
    @form_sheet = FormSheet.find(params[:form_sheet_id])
    @question = Question.find(params[:id])
  rescue Exception => e
    p e
  end

  def question_params
    params.fetch(:question,{}).permit(:content, :status)
  end
end
