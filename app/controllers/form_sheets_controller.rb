class FormSheetsController < ApplicationController
  before_action :set_form_sheet, only: [:show, :edit, :update, :destroy]

  # GET /form_sheets
  # GET /form_sheets.json
  def index
    @form_sheets = FormSheet.all
  end

  # GET /form_sheets/1
  # GET /form_sheets/1.json
  def show
  end

  # GET /form_sheets/new
  def new
    @form_sheet = FormSheet.new
  end

  # GET /form_sheets/1/edit
  def edit
  end

  # POST /form_sheets
  # POST /form_sheets.json
  def create
    @form_sheet = FormSheet.new(form_sheet_params)

    respond_to do |format|
      if @form_sheet.save
        format.html { redirect_to @form_sheet, notice: 'Form sheet was successfully created.' }
        format.json { render :show, status: :created, location: @form_sheet }
      else
        format.html { render :new }
        format.json { render json: @form_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_sheets/1
  # PATCH/PUT /form_sheets/1.json
  def update
    respond_to do |format|
      if @form_sheet.update(form_sheet_params)
        format.html { redirect_to @form_sheet, notice: 'Form sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_sheet }
      else
        format.html { render :edit }
        format.json { render json: @form_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_sheets/1
  # DELETE /form_sheets/1.json
  def destroy
    @form_sheet.destroy
    respond_to do |format|
      format.html { redirect_to form_sheets_url, notice: 'Form sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_sheet
      @form_sheet = FormSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_sheet_params
      params.require(:form_sheet).permit(:title, :content)
    end
end
