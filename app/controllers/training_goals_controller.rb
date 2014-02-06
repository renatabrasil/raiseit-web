class TrainingGoalsController < ApplicationController
  def show
    @training_goal = TrainingGoal.find(params[:id])
  end
  
  def index
    @training_goals = TrainingGoal.all
  end
  
  def new
    @training_goal = TrainingGoal.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @training_goal }
    end
  end
  
  def create
    @training_goal = TrainingGoal.new(params[:training_goal])
    
    @training_goal.denomination.upcase
    
    respond_to do |format|
      if @training_goal.save
        format.html { redirect_to training_goals_path, notice: 'O objetivo foi cadastrado com sucesso.' }
        format.json { render json: @training_goal, status: :created, location: @training_goal }
      else
        format.html { render action: "new" }
        format.json { render json: @training_goal.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @training_goal = TrainingGoal.find(params[:id])
  end
  
  def update
    @training_goal = TrainingGoal.find(params[:id])
    
    respond_to do |format|
      if @training_goal.update_attributes(params[:training_goal])
        format.html { redirect_to training_goals_path, :notice => 'O objetivo foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @training_goal.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @training_goal = TrainingGoal.find(params[:id])
    
    @training_goal.destroy

    respond_to do |format|
        format.html { redirect_to training_goals_url, notice: 'Objetivo removido com sucesso.'  }
        format.json { head :no_content }
    end  
  end
end
