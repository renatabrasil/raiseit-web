class WorkoutSheetsController < ApplicationController
  def show
    @workout_sheet = WorkoutSheet.find(params[:id])
  end
  
  def index
    @workout_sheets = WorkoutSheet.all
  end
  
  def new
    @workout_sheet = WorkoutSheet.new
    @workout_sheet.trainings.build
    
    @instructors = load_instructors
    
    if !params[:student_id].nil?
      @training.student = Student.find(params[:student_id])
      @disabled = "true"
    end
    # Depois mudar
    @workout_sheet.model_workout_sheet = ModelWorkoutSheet.find(ModelWorkoutSheet::DEFAULT)
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout_sheet }
    end
  end
  
  def create
    @workout_sheet = WorkoutSheet.new(params[:workout_sheet])
    @workout_sheet.model_workout_sheet = ModelWorkoutSheet.find(ModelWorkoutSheet::DEFAULT)
    
    if params[:commit] == "Criar Treino"
      puts "VEJA " + params[:commit] + "\n\n"
    end    
    
    respond_to do |format|
      if @workout_sheet.save
        format.html { redirect_to workout_sheet_path(@workout_sheet), notice: 'A ficha de treino foi cadastrada com sucesso.' }
        format.json { render json: @workout_sheet, status: :created, location: @workout_sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @workout_sheet.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def edit
    @workout_sheet = WorkoutSheet.find(params[:id])
    # To load instructor relates to bodybuilding
    @instructors = load_instructors
  end
  
  def update
    @workout_sheet = WorkoutSheet.find(params[:id])
    
    respond_to do |format|
      if @workout_sheet.update_attributes(params[:workout_sheet])
        # The update flow isn't over yet
        if !params[:action_button].nil?
          format.html { redirect_to workout_sheet_path(@workout_sheet) }
          format.json { head :ok }
        end
        format.html { redirect_to workout_sheets_path, :notice => 'A ficha foi atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @workout_sheet.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @workout_sheet = WorkoutSheet.find(params[:id])
    
    @workout_sheet.destroy

    respond_to do |format|
        format.html { redirect_to workout_sheets_url, notice: 'Ficha de treino removida com sucesso.'  }
        format.json { head :no_content }
    end  
  end
  
  private
  
  def load_instructors
    return Instructor.distinct.joins(:class_gyms).joins("INNER JOIN modalities ON 
      modalities.id = class_gyms.modality_id").where("modalities.id = ?", Modality::WORK_OUT)
  end
  
end
