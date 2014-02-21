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
    
    render "form_exercise"
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
          format.html { redirect_to form_training_profile_training_path(@profile_training), notice: 'Perfil '+@profile_training.name+' foi cadastrado com sucesso.' }
          format.json { render json: @profile_training, status: :created, location: @profile_training }
        # end
      else
        format.html { render action: "new" }
        format.json { render json: @profile_training.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  def form_training
    @profile_training = ProfileTraining.find(params[:id])
  end
  
  def edit
    @profile_training = ProfileTraining.find(params[:id])
  end
  
  def update
    
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
