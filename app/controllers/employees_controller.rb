# encoding: utf-8
class EmployeesController < ApplicationController
  def index
    
    @employees = Employee.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
    
  end
  
  def new
    @employee = Employee.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end
  
  def create
    @employee = Employee.new(params[:employee])
    
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
