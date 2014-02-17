# encoding: utf-8
class EquipmentsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @equipments = Equipment.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @equipments }
    end
    
  end
  
  def new
    @equipment = Equipment.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @equipment }
    end
  end
  
  def create
    @equipment = Equipment.new(params[:equipment])
    
    respond_to do |format|
      if @equipment.save
        format.html { redirect_to equipments_path, notice: 'O equipamento foi cadastrado com sucesso.' }
        format.json { render json: @equipment, status: :created, 
                        location: @equipment }
      else
        format.html { render action: "new" }
        format.json { render json: @equipment.errors, 
                        status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @equipment = Equipment.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @equipment }
    end
  end
  
  def edit
    @equipment = Equipment.find(params[:id])
  end
  
  def update
    @equipment = Equipment.find(params[:id])
    
    respond_to do |format|
      if @equipment.update_attributes(params[:equipment])
        format.html { redirect_to equipment_path, 
          :notice => 'O equipamento foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @equipment.errors, 
          :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    respond_to do |format|
      format.html { redirect_to equipments_url, 
        :notice => 'O equipamento foi removido com sucesso.' }
      format.json { head :ok }
    end
  end
end
