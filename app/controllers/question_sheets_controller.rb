class QuestionSheetsController < ApplicationController
  before_action :set_question_sheet, only: [:show, :edit, :update, :destroy]

  # GET /question_sheets
  # GET /question_sheets.json
  def index
    @question_sheets = QuestionSheet.all
  end

  # GET /question_sheets/1
  # GET /question_sheets/1.json
  def show
  end

  # GET /question_sheets/new
  def new

    question_sheet = QuestionSheet.create!
    redirect_to edit_question_sheet_path(question_sheet)
  end

  # GET /question_sheets/1/edit
  def edit
  end

  def position
    Question.update(*params.fetch(:priority,{}).permit!().values.map{|l| [l["id"], l.except("id")]}.transpose())
  end

  # POST /question_sheets
  # POST /question_sheets.json
  def create
    byebug
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

  # PATCH/PUT /question_sheets/1
  # PATCH/PUT /question_sheets/1.json
  def update
    respond_to do |format|
      if @question_sheet.update(question_sheet_params)
        format.html { redirect_to @question_sheet, notice: 'Form sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_sheet }
      else
        format.html { render :edit }
        format.json { render json: @question_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_sheets/1
  # DELETE /question_sheets/1.json
  def destroy
    @question_sheet.destroy
    respond_to do |format|
      format.html { redirect_to question_sheets_url, notice: 'Form sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_sheet
      @question_sheet = QuestionSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_sheet_params
      params.require(:question_sheet).permit(:title, :content)
    end
end
