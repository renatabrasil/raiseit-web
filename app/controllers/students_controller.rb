# encoding: utf-8
class StudentsController < ApplicationController
  load_and_authorize_resource
  
  def index
    
    # Autocomplete
    if !params[:term].nil?
      term = params[:term].to_s.upcase
      @students = Student.find(:all, include: :registration_code, :conditions => ['UPPER(name) LIKE ?', "#{term}%"])
    else
      @search = Student.search(params[:q])
      @students = @search.result(distinct: true)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
    
  end
  
  def new
    @student = Student.new
    @student.build_user
    @student.build_registration_code
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end
  
  def create
    @student = Student.new(params[:student])
    
    @student.user.email = @student.email
    @student.user.username = @student.registration_code.code
    
    @student.user.roles << Role.find(Role::STUDENT)
    
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
  
  def profile
    @student = Student.find(params[:id])
  end
  
  def payments
    @student = Person.find(params[:id])
    @payments = @student.payments
  end
  
  def class_gyms
    @student = Person.find(params[:id])
    @class_gyms = @student.class_gyms
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
