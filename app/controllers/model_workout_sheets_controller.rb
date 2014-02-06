class ModelWorkoutSheetsController < ApplicationController
  before_action :set_model_workout_sheet, only: [:show, :edit, :update, :destroy]

  # GET /model_workout_sheets
  # GET /model_workout_sheets.json
  def index
    @model_workout_sheets = ModelWorkoutSheet.all
  end

  # GET /model_workout_sheets/1
  # GET /model_workout_sheets/1.json
  def show
  end

  # GET /model_workout_sheets/new
  def new
    @model_workout_sheet = ModelWorkoutSheet.new
  end

  # GET /model_workout_sheets/new_copy
  def new_copy
    @model_workout_sheet = ModelWorkoutSheet.new_copy(params[:id])
  end
  
  # GET /model_workout_sheets/1/edit
  def edit
  end

  # POST /model_workout_sheets
  # POST /model_workout_sheets.json
  def create
    @model_workout_sheet = ModelWorkoutSheet.new(model_workout_sheet_params)

    respond_to do |format|
      if @model_workout_sheet.save
        format.html { redirect_to @model_workout_sheet, notice: 'Model workout sheet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @model_workout_sheet }
      else
        format.html { render action: 'new' }
        format.json { render json: @model_workout_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_workout_sheets/1
  # PATCH/PUT /model_workout_sheets/1.json
  def update
    respond_to do |format|
      if @model_workout_sheet.update(model_workout_sheet_params)
        format.html { redirect_to @model_workout_sheet, notice: 'Model workout sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @model_workout_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_workout_sheets/1
  # DELETE /model_workout_sheets/1.json
  def destroy
    @model_workout_sheet.destroy
    respond_to do |format|
      format.html { redirect_to model_workout_sheets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_workout_sheet
      @model_workout_sheet = ModelWorkoutSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_workout_sheet_params
      params.require(:model_workout_sheet).permit(:name,  physical_categories_attributes: [:id, :name, :_destroy, workouts_attributes:[:id, :description, :_destroy] ])
    end
end
