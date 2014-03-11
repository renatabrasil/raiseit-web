# encoding: utf-8
class ProfileTrainingsController < ApplicationController
    
  def index
    @profile_trainings = ProfileTraining.all
  end
  
  def new
    @profile_training = ProfileTraining.new
    @profile_training.build_training
    @profile_training.training.training_workouts
    @profile_training.training.workouts
    
    render "_form_exercise"
  end
  
  def create
    @profile_training = ProfileTraining.new(params[:profile_training])
    if !current_user.user_account.nil?
      @profile_training.created_by = current_user.user_account
    end

    error = false
    # error = insert_workouts_with_errors
    respond_to do |format|
      if !error && @profile_training.save
        if !params[:training_copy].nil? and params[:training_copy] == "true"
          format.html { redirect_to profile_training_path(@profile_training), notice: 'Perfil '+@profile_training.name+' foi cadastrado com sucesso.' }
          format.json { render json: @profile_training, status: :created, location: @profile_training }
        else
          # error = insert_workouts
          # Comes to Copy Profile
        format.html { render "_form_training", notice: 'Perfil '+@profile_training.name+' foi cadastrado com sucesso.' }
        format.json { render json: @profile_training, status: :created, location: @profile_training }
        end
      else
        format.html { render "_form_exercise" }
        format.json { render json: @profile_training.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @profile_training = ProfileTraining.find(params[:id])
  end
  
  def form_training
    @profile_training = ProfileTraining.find(params[:id])
    render "_form_training"
  end
  
  def form_exercise
    @profile_training = ProfileTraining.find(params[:id])
    render "_form_exercise"
  end
  
  # From list trainings in workout_sheets
  def new_copy
    @profile_training = ProfileTraining.new
    @profile_training.training_goal = TrainingGoal.find(params[:training_goal_id])
    @profile_training.name = define_name_automatically(params[:training_goal_id])
    @profile_training.training = Training.new_copy(params[:id])
    
    respond_to do |format|
      format.html { render "_form_training", notice: 'Perfil foi copiado com sucesso.' }
      format.json { render json: [@profile_training, @profile_training.training.training_workouts], status: :created, location: @profile_training }
    end
  end
  
  def edit
    @profile_training = ProfileTraining.find(params[:id])
    # render "form_training"
  end
  
  def update
    @profile_training = ProfileTraining.find(params[:id])
    
    respond_to do |format|
      if @profile_training.update_attributes(params[:profile_training])
        # The update flow isn't over yet
        if !params[:action_button].nil?
          format.html { redirect_to form_training_profile_training_path(@profile_training) }
          format.json { head :ok }
        else
          format.html { redirect_to profile_training_path(@profile_training), :notice => 'O perfil foi atualizado com sucesso.' }
          format.json { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.json { render :json => @training.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @profile_training = ProfileTraining.find(params[:id])
    
    @profile_training.destroy

    respond_to do |format|
        format.html { redirect_to profile_trainings_url, notice: 'Perfil de treino removido com sucesso.'  }
        format.json { head :no_content }
    end  
  end
  
  private
  
  def define_name_automatically(training_goal_id)
    if !@profile_training.training_goal.nil?
      return 'Treino de '+ @profile_training.training_goal.denomination.downcase.camelcase + " " + (ProfileTraining.size_by_training_goal(training_goal_id)+1).to_s
    end
     return "Treino"
  end
  
  def insert_workouts_with_errors
    if !@profile_training.training.nil? && @profile_training.training.workouts.empty?
      flash[:notice] = "Informe pelo menos um exercício."
      return true
    else
      if @profile_training.training.nil?
        if params[:profile_training][:training_attributes].nil? or params[:profile_training][:training_attributes][:workout_ids].nil?
          flash[:notice] = "Informe pelo menos um exercício."      
          return true
        else
          return false
        end
      end
    end
    
  end
  
end
