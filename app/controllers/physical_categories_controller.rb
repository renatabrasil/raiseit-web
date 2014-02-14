class PhysicalCategoriesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_physical_category, only: [:show, :edit, :update, :destroy]

  # GET /physical_categories
  # GET /physical_categories.json
  def index
    @physical_categories = PhysicalCategory.all
    
    @physical_category = PhysicalCategory.new
  end

  # GET /physical_categories/1
  # GET /physical_categories/1.json
  def show
  end

  # GET /physical_categories/new
  def new
    @physical_category = PhysicalCategory.new
  end

  # GET /physical_categories/1/edit
  def edit
  end

  # POST /physical_categories
  # POST /physical_categories.json
  def create
    @physical_category = PhysicalCategory.new(physical_category_params)

    respond_to do |format|
      if @physical_category.save
        format.html { redirect_to physical_categories_path, notice: 'Physical category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @physical_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @physical_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /physical_categories/1
  # PATCH/PUT /physical_categories/1.json
  def update
    respond_to do |format|
      if @physical_category.update(physical_category_params)
        format.html { redirect_to model_workout_sheet_path(@physical_category.model_workout_sheet), notice: 'Physical category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @physical_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_categories/1
  # DELETE /physical_categories/1.json
  def destroy
    @physical_category.destroy
    respond_to do |format|
      format.html { redirect_to physical_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physical_category
      @physical_category = PhysicalCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def physical_category_params
      params.require(:physical_category).permit(:name, workouts_attributes: [:id, :description, :_destroy])
    end
end
