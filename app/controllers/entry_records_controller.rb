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
    @entry_record_now = EntryRecord.last
       
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry_record }
    end
  end
  
  def create 
    person_with_enrollment = Person.find_by enrollment: params[:enrollment].to_s
    
    if person_with_enrollment.nil?
      person_with_enrollment = Person.new
    end
    
    person_password = User.find_by_user_account_id(person_with_enrollment.id)
    
    if person_with_enrollment.new_record?  || !person_password.valid_password?(params[:password]) 
        flash[:notice] = "Matricula ou senha Incorreta"
        redirect_to new_entry_record_url
    else
      
      if EntryRecord.find_by_individual_id(person_with_enrollment.id).nil?   
        @entry_record = EntryRecord.new(params[:entry_record])
        @entry_record.individual_id = person_with_enrollment.id
        @entry_record.entry_time = Time.zone.now
      elsif EntryRecord.find_by_individual_id(person_with_enrollment.id).exit_time.blank?
        @entry_record = EntryRecord.find_by_individual_id(person_with_enrollment.id)
        @entry_record.exit_time = Time.zone.now
      else
        @entry_record = EntryRecord.new(params[:entry_record])
        @entry_record.individual_id = person_with_enrollment.id
        @entry_record.entry_time = Time.zone.now
      end
      
      respond_to do |format|
        if @entry_record.save
          format.html { redirect_to new_entry_record_path, notice: 'Registrado com sucesso.' }
          format.json { render json: @entry_record, status: :created, location: @entry_record }
        else
          format.html { render action: "new" }
          format.json { render json: @entry_record.errors, status: :unprocessable_entity }
        end
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
