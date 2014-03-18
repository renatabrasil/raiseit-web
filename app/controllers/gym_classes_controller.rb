class GymClassesController < ApplicationController
  load_and_authorize_resource
  
  def form_partial
    @gym_classes = GymClass.where(modality_id: params[:modality_id])
    puts "modality_id: "+params[:modality_id].to_s
    @gym_classes.each do |gym_class|
      puts "gym_class_id:"+gym_class.id.to_s
    end
  end
  
  def show
    @gym_class = GymClass.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @gym_class }
    end  
  end
  
  def index
    @gym_classes = GymClass.all
  end
  
  def new
    @gym_class = GymClass.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gym_class }
    end
  end
  
  def create
    @gym_class = GymClass.new(params[:gym_class])
    # @gym_class.instructors = Employee.find(params[:instructor_ids])
    
    respond_to do |format|
      if @gym_class.save
        format.html { redirect_to gym_classes_path, notice: 'A turma foi cadastrada com sucesso.' }
        format.json { render json: @gym_class, status: :created, location: @gym_class }
      else
        format.html { render action: "new" }
        format.json { render json: @gym_class.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @gym_class = GymClass.find(params[:id])
  end
  
  def update
    @gym_class = GymClass.find(params[:id])
    
    respond_to do |format|
      if @gym_class.update_attributes(params[:gym_class])
        format.html { redirect_to gym_classes_path, :notice => 'A turma foi atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @gym_class.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @gym_class = GymClass.find(params[:id])
    
    @gym_class.destroy

    respond_to do |format|
        format.html { redirect_to gym_classes_url, notice: 'Turma removida com sucesso.'  }
        format.json { head :no_content }
    end  
  end
  
  def student_attendance
    @gym_class = GymClass.find(params[:id])
  end

end
