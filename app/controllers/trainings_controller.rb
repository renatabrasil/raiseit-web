class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end
  
  def new
    @training = Training.new
    @training.training_workouts.build
    @training.workouts.build
    
    if !params[:student_id].nil?
      @training.student = Student.find(params[:student_id])
      @disabled = "true"
    end 
    
    # Depois mudar
    @training.model_workout_sheet = ModelWorkoutSheet.find(ModelWorkoutSheet::DEFAULT)
    @instructors = Instructor.distinct.joins(:class_gyms).joins("INNER JOIN modalities ON 
      modalities.id = class_gyms.modality_id").where("modalities.id = ?", Modality::WORK_OUT)
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @training }
    end
  end
  
  def create
    @training = Training.new(params[:training])
    @training.workouts = Workout.find(params[:workout_ids])
    @training.model_workout_sheet = ModelWorkoutSheet.find(ModelWorkoutSheet::DEFAULT)
    @training.workout_sheet = WorkoutSheet.find(params[:workout_sheet_id])
    
    respond_to do |format|
      if @training.save
        format.html { redirect_to specify_exercises_training_path(@training), notice: 'A ficha de treino foi cadastrada com sucesso.' }
        format.json { render json: @training, status: :created, location: @training }
      else
        format.html { render action: "new" }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @training = Training.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @training }
    end
  end
  
  def edit
    @training = Training.find(params[:id])
    # To load instructor relates to bodybuilding
    @instructors = Instructor.distinct.joins(:class_gyms).joins("INNER JOIN modalities ON 
      modalities.id = class_gyms.modality_id").where("modalities.id = ?", Modality::WORK_OUT)
    
    
  end
  
  def update
    @training = Training.find(params[:id])
    
    respond_to do |format|
      if @training.update_attributes(params[:training])
        # The update flow isn't over yet
        if !params[:action_button].nil?
          @training.workouts = Workout.find(params[:workout_ids])
          format.html { redirect_to specify_exercises_training_path(@training) }
          format.json { head :ok }
        else
          format.html { redirect_to workout_sheet_path(@training.workout_sheet), :notice => 'O treino foi atualizado com sucesso.' }
          format.json { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.json { render :json => @training.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def specify_exercises
    @training = Training.find(params[:id])
    # @training.training_workouts.build
  end
  
  def destroy
    @training = Training.find(params[:id])
    @workout_sheet = @training.workout_sheet
    
    @training.destroy

    respond_to do |format|
        format.html { redirect_to workout_sheet_path(@workout_sheet), notice: 'Treino removida com sucesso.'  }
        format.json { head :no_content }
    end  
  end
  
    
end
