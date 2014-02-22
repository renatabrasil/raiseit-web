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
    # respond_to do |format|
      # format.html { render "form_exercise" }
      # format.json { render json: @profile_training }
    # end
  end
  
  def create
    @profile_training = ProfileTraining.new(params[:profile_training])
    insert_workouts
    respond_to do |format|
      if @profile_training.save
        # error = insert_workouts
        # if !error
          # @profile.training.update_attributes(params[:profile_training][:training])
          format.html { render "_form_training", notice: 'Perfil '+@profile_training.name+' foi cadastrado com sucesso.' }
          format.json { render json: @profile_training, status: :created, location: @profile_training }
        # end
      else
        format.html { render action: "new" }
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
  
  def new_copy
    @profile_training = ProfileTraining.new
    @profile_training.training_goal = TrainingGoal.find(params[:training_goal_id])
    @profile_training.name = 'Treino de '+ @profile_training.training_goal.denomination
    @profile_training.build_training
    @profile_training.training.training_workouts
    @profile_training.training.workouts
    @profile_training.training = Training.new_copy(params[:id])
    
    respond_to do |format|
      # if @profile_training.save
        # format.html { redirect_to form_training_profile_training_path(@profile_training), notice: 'Perfil foi copiado com sucesso.' }
        format.html { render "_form_training", notice: 'Perfil foi copiado com sucesso.' }
        format.json { render json: [@profile_training, @profile_training.training.training_workouts], status: :created, location: @profile_training }
      # else
        # format.html { render action: "new" }
        # format.json { render json: @profile_training.errors, status: :unprocessable_entity }
      # end
    end
  end
  
  def create_copy
    @profile_training = ProfileTraining.new(params[:profile_training])
    respond_to do |format|
      if @profile_training.save
        format.html { render "_form_training", notice: 'Perfil '+@profile_training.name+' foi cadastrado com sucesso.' }
        format.json { render json: @profile_training, status: :created, location: @profile_training }
      else
        format.html { render action: "new" }
        format.json { render json: @profile_training.errors, status: :unprocessable_entity }
      end
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
  def insert_workouts
    # if !params[:workout_ids].to_a.empty?
      # if @profile_training.training.nil? 
        # puts '\n\nO treino é vazio\n\n'
        # @profile_training.training = params[:profile_training][:training]
      # end
      # @profile_training.training.workouts = Workout.find(params[:workout_ids])
      # return true
    # else
      # flash[:notice] = "Informe pelo menos um exercício."
      # return false
    # end
  end
  
end
