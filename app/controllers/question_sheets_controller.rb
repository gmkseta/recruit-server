class QuestionSheetsController < ApplicationController
  before_action :set_question_sheet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @question_sheets = QuestionSheet.all
  end

  def new
    question_sheet = QuestionSheet.create!
    redirect_to edit_question_sheet_path(question_sheet)
  end


  def edit
  end

  def position
    Question.update(*position_params)
  end

  def create
    @question_sheet = QuestionSheet.new(question_sheet_params)

    respond_to do |format|
      if @question_sheet.save
        format.html { redirect_to @question_sheet, notice: 'Form sheet was successfully created.' }
        format.json { render :show, status: :created, location: @question_sheet }
      else
        format.html { render :new }
        format.json { render json: @question_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @question_sheet.update_attributes(question_sheet_params)
    # respond_to do |format|
      # if @question_sheet.update(question_sheet_params)
        # format.html { redirect_to @question_sheet, notice: 'Form sheet was successfully updated.' }
        # format.json { render :show, status: :ok, location: @question_sheet }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @question_sheet.errors, status: :unprocessable_entity }
      # end
    # end
  end

  def destroy
    @question_sheet.destroy
    respond_to do |format|
      format.html { redirect_to question_sheets_url, notice: 'Form sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_question_sheet
      @question_sheet = QuestionSheet.find(params[:id])
    end

    def question_sheet_params
      params.require(:question_sheet).permit(:title, :content, :start_date, :end_date)
    end
    def position_params
      JSON.parse(params.permit(:position)["position"]).transpose()
    end
end
