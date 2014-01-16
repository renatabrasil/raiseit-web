class ModalitiesController < ApplicationController
  def index
    @modalities = Modality.all.order("name ASC")
  end
  
  def show
    @modality = Modality.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @modality }
    end
  end
  
  def new
    @modality = Modality.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @modality }
    end
  end
  
  def create
    @modality = Modality.new(params[:modality])
    
    @modality.name = @modality.name.upcase
    
    respond_to do |format|
      if @modality.save
        format.html { redirect_to modalities_path, notice: 'A turma foi cadastrada com sucesso.' }
        format.json { render json: @modality, status: :created, location: @modality }
      else
        format.html { render action: "new" }
        format.json { render json: @modality.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @modality = Modality.find(params[:id])
  end
  
  def update
    @modality = Modality.find(params[:id])
    
    respond_to do |format|
      if @modality.update_attributes(params[:modality])
        format.html { redirect_to modalities_path, :notice => 'A modalidade foi atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @modality.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @modality = Modality.find(params[:id])
    
    @modality.destroy

    respond_to do |format|
        format.html { redirect_to modalities_url, notice: 'Modalidade removida com sucesso.'  }
        format.json { head :no_content }
    end
  end
  
end
