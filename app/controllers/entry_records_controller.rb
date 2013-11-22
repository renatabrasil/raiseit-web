class EntryRecordsController < ApplicationController
  #load_and_authorize_resource
  
  def index
    
    @entry_records = EntryRecord.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entry_records }
    end
    
  end
  
  def new
    @entry_record = EntryRecord.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry_record }
    end
  end
  
  def create
    @entry_record = EntryRecord.new(params[:entry_record])
    
    @entry_record.individual_id = Person.find_by enrollment: params[:teste]
    
    @entry_record.entryTime = Time.now
    respond_to do |format|
      if @entry_record.save
        format.html { redirect_to entry_records_path, notice: 'Registrado com sucesso.' }
        format.json { render json: @entry_record, status: :created, location: @entry_record }
      else
        format.html { render action: "new" }
        format.json { render json: @entry_record.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @entry_record = EntryRecord.find(params[:id])
    
    #@endereco = Endereco.find(:first,:conditions => { :corretor_id => @user.corretor.id} )
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @entry_record }
    end
  end
  
  def edit
    @entry_record = EntryRecord.find(params[:id])
  end
  
  def update
    @entry_record = EntryRecord.find(params[:id])
    
    respond_to do |format|
      if @entry_record.update_attributes(params[:entry_record])
        format.html { redirect_to entry_records_path, :notice => 'O Registro foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @entry_record.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @entry_record = EntryRecord.find(params[:id])
    @entry_record.destroy

    respond_to do |format|
      format.html { redirect_to entry_records_url, :notice => 'O Registro foi removido com sucesso.' }
      format.json { head :ok }
    end
  end
end
