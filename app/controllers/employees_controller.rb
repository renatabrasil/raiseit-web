# encoding: utf-8
class EmployeesController < ApplicationController
  load_and_authorize_resource
  
  def index
    
    @employees = Employee.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
    
  end
  
  def new
    @employee = Employee.new
    @employee.build_user
    
    type_employee = params[:type_employee].nil? ? nil : params[:type_employee].to_i 
    
    if !type_employee.nil?
      @employee.type_employee = TypeEmployee.find(type_employee)
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end
  
  def create
    @employee = Employee.new(params[:employee])
    
    @employee.user.email = @employee.email
    @employee.user.username = @employee.code
    
    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, notice: 'Funcionário '+@employee.name+' foi cadastrado com sucesso.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @employee = Employee.find(params[:id])
    
    #@endereco = Endereco.find(:first,:conditions => { :corretor_id => @user.corretor.id} )
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @employee }
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    
    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to employees_path, :notice => 'O funcionário foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, :notice => 'O funcionário foi removido com sucesso.' }
      format.json { head :ok }
    end
  end
end
