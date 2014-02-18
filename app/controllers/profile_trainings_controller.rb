# encoding: utf-8
class ProfileTrainingsController < ApplicationController
    
  def index
    @profile_trainings = ProfileTraining.all
  end
  
  def new
    @profile_training = ProfileTraining.new
    @profile_training.build_training
    @profile_training.training.training_workouts.build
    @profile_training.training.workouts.build
  end
  
  def create
    @profile_training = ProfileTraining.new(params[:profile_training])
    
    respond_to do |format|
      if @profile_training.save
        format.html { redirect_to profile_trainings_path, notice: 'Perfil '+@profile_training.name+' foi cadastrado com sucesso.' }
        format.json { render json: @profile_training, status: :created, location: @profile_training }
      else
        format.html { render action: "new" }
        format.json { render json: @profile_training.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @profile_training = ProfileWorkoutSheet.find(params[:id])
  end
  
  def update
    
  end
end
