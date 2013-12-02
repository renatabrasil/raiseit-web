class ClassGymsController < ApplicationController
  def index
    @class_gyms = ClassGym.all
  end
  
  def show
    @class_gym = ClassGym.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @class_gym }
    end
  end
  
  def new
    @class_gym = ClassGym.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @class_gym }
    end
  end
  
  def create
    @class_gym = ClassGym.new(params[:class_gym])
    
    respond_to do |format|
      if @class_gym.save
        format.html { redirect_to class_gyms_path, notice: 'A turma foi cadastrada com sucesso.' }
        format.json { render json: @class_gym, status: :created, location: @class_gym }
      else
        format.html { render action: "new" }
        format.json { render json: @class_gym.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @class_gym = ClassGym.find(params[:id])
  end
  
  def update
    @class_gym = ClassGym.find(params[:id])
    
    respond_to do |format|
      if @class_gym.update_attributes(params[:class_gym])
        format.html { redirect_to class_gyms_path, :notice => 'A turma foi atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @class_gym.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    
  end
end
