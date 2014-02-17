# encoding: utf-8
class InstructorsController < ApplicationController
  load_and_authorize_resource
  
  def index
    
    @instructors = Instructor.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @instructors }
    end
    
  end
  
  def new
    @instructor = Instructor.new
    @instructor.build_user
    @instructor.build_registration_code
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @instructor }
    end
  end
  
  def create
    @instructor = Instructor.new(params[:instructor])
    
    @instructor.user.email = @instructor.email
    @instructor.user.username = @instructor.registration_code.code
    
    @instructor.user.roles << Role.find(Role::INSTRUCTOR)
    
    respond_to do |format|
      if @instructor.save
        format.html { redirect_to instructors_path, notice: 'O professor '+ 
                          @instructor.name + ' foi cadastrado com sucesso.' }
        format.json { render json: @instructor, status: :created, 
                        location: @instructor }
      else
        format.html { render action: "new" }
        format.json { render json: @instructor.errors, 
                        status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @instructor = Instructor.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @instructor }
    end
  end
  
  def edit
    @instructor = Instructor.find(params[:id])
  end
  
  def update
    @instructor = Instructor.find(params[:id])
    
    respond_to do |format|
      if @instructor.update_attributes(params[:instructor])
        format.html { redirect_to instructors_path, 
          :notice => 'O professor foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @instructor.errors, 
          :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy

    respond_to do |format|
      format.html { redirect_to instructors_url, 
        :notice => 'O professor foi removido com sucesso.' }
      format.json { head :ok }
    end
  end
end
