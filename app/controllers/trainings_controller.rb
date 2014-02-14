# encoding: utf-8
class TrainingsController < ApplicationController
  def new
    @workout_sheet = WorkoutSheet.find(params[:workout_sheet_id])
    @training = Training.new
    @training.training_workouts.build
    @training.workouts.build
    @training.workout_sheet = @workout_sheet
    @disabled = true
    if @training.next_training_type.blank?
      @disabled = false
    end
    
    if !params[:student_id].nil?
      @training.student = Student.find(params[:student_id])
      @disabled = "true"
    end 
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: [@training, @workout_sheet] } 
    end
  end
  
  def create
    @training = Training.new(params[:training])
    @training.workout_sheet = WorkoutSheet.find(params[:workout_sheet_id])
    # @training.next_training_type
    
    error = false
    if !params[:workout_ids].to_a.empty?
      @training.workouts = Workout.find(params[:workout_ids])
    else
      flash[:notice] = "Informe pelo menos um exercício."
      error = true
    end
    
    @training.valid?
    @disabled = true
    if !@training.errors[:training_type].nil?
      @disabled = false
    end
    
    respond_to do |format|
      if !error && @training.save
        format.html { redirect_to specify_exercises_workout_sheet_training_path(@training.workout_sheet, @training), notice: 'A ficha de treino foi cadastrada com sucesso.' }
        format.json { render json: @training, status: :created, location: @training }
      else
        format.html { render action: "new" }
        format.json { render json: [@training.errors, @workout_sheet.errors], status: :unprocessable_entity }
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
    @workout_sheet = @training.workout_sheet
    @disabled = true
  end
  
  def update
    @training = Training.find(params[:id])
    
    # You can't modify training_type yet
    if !params[:training][:training_type].nil?
      params[:training].delete(:training_type)
    end
    
    respond_to do |format|
      if @training.update_attributes(params[:training])
        # The update flow isn't over yet
        if !params[:action_button].nil?
          @training.workouts = Workout.find(params[:workout_ids])
          format.html { redirect_to specify_exercises_workout_sheet_training_path(@training.workout_sheet, @training) }
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
