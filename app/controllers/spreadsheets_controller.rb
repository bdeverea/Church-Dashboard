class SpreadsheetsController < ApplicationController
  before_action :set_spreadsheet, only: [:show, :edit, :update, :destroy]

  # GET /spreadsheets
  # GET /spreadsheets.json
  def index
    @spreadsheets = Spreadsheet.all
  end

  def import
    # @spreadsheet = Event.import(params[:file])
    # @workbook = Roo::Spreadsheet.open("/Library/WebServer/Documents/harbor/contribution_comparison_2013+2014.xlsx")
    # @headers = @workbook.sheet(1).row(1).compact


  end

  # GET /spreadsheets/1
  # GET /spreadsheets/1.json
  def show
  end

  # GET /spreadsheets/new
  def new
    @spreadsheet = Spreadsheet.new
  end

  # GET /spreadsheets/1/edit
  def edit
  end

  # POST /spreadsheets
  # POST /spreadsheets.json
  def create
    @spreadsheet = Spreadsheet.new(spreadsheet_params)

    respond_to do |format|
      if @spreadsheet.save
        format.html { redirect_to @spreadsheet, notice: 'Spreadsheet was successfully uploaded.' }
        format.json { render action: 'show', status: :created, location: @spreadsheet }

      else
        format.html { render action: 'new' }
        format.json { render json: @spreadsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spreadsheets/1
  # PATCH/PUT /spreadsheets/1.json
  def update
    respond_to do |format|
      if @spreadsheet.update(spreadsheet_params)
        format.html { redirect_to @spreadsheet, notice: 'Spreadsheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @spreadsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spreadsheets/1
  # DELETE /spreadsheets/1.json
  def destroy
    @spreadsheet.destroy
    respond_to do |format|
      format.html { redirect_to spreadsheets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spreadsheet
      @spreadsheet = Spreadsheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spreadsheet_params
      params.require(:spreadsheet).permit(:name, :description, :created_by, :modified_by, :headers, :content, :workbook)
    end
end
