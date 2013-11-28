# encoding: utf-8
class StudentsController < ApplicationController
  load_and_authorize_resource
  
  def index
    
    @students = Student.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
    
  end
  
  def new
    @student = Student.new
    @student.build_user
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end
  
  def create
    @student = Student.new(params[:student])
    
    @student.user.email = @student.email
    @student.user.username = @student.enrollment
    
    respond_to do |format|
      if @student.save
        format.html { redirect_to students_path, notice: 'Estudante '+@student.name+' foi cadastrado com sucesso.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @student = Student.find(params[:id])
    
    #@endereco = Endereco.find(:first,:conditions => { :corretor_id => @user.corretor.id} )
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @student }
    end
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    
    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to students_path, :notice => 'O estudante foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, :notice => 'O estudante foi removido com sucesso.' }
      format.json { head :ok }
    end
  end
  
end
