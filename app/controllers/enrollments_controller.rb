# encoding: utf-8
class EnrollmentsController < ApplicationController
  def index
    @search = Enrollment.joins(:student).search(params[:q])
    @enrollments = @search.result(distinct: true, :order => 'created_at DESC')
    
    # @enrollments = Enrollment.all
    # @vencimentos = Payment.where({ name: "Joe", email: "joe@example.com" })
    # @vencimentos = Payment.where(individual_id: author)
  end
  
  def edit
    @enrollment = Enrollment.find(params[:id])
  end
  
  def update
    @enrollment = Enrollment.find(params[:id])
    
    respond_to do |format|
      if @enrollment.update_attributes(params[:enrollment])
        format.html { redirect_to confirm_registration_enrollment_path(@enrollment, :modality_id => @enrollment.modality.id), :notice => 'A matrícula foi atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @enrollment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new
    @enrollment = Enrollment.new
    @enrollment.periodicity = Periodicity.find(Periodicity::MENSAL)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enrollment }
    end
  end
  
  def create
    @enrollment = Enrollment.new(params[:enrollment])
    # Atualmente a periodicidade está mensal para efeitos de teste
    @enrollment.periodicity = Periodicity.find(Periodicity::MENSAL)
    
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to confirm_registration_enrollment_path(@enrollment, :modality_id => @enrollment.modality.id), notice: 'A matrícula foi efetuada com sucesso.' }
        format.json { render json: @enrollment, status: :created, location: @enrollment }
      else
        format.html { render action: "new" }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @enrollment = Enrollment.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @enrollment }
    end  
  end
  
  def confirm_registration
    @enrollment = Enrollment.find(params[:id])
    @class_gyms = ClassGym.all.where("class_gyms.open = true AND class_gyms.modality_id = "+params[:modality_id].to_s)
  end
  
  def add_student
    @class_gym = ClassGym.find(params[:class_gym_id])
    @enrollment = Enrollment.find(params[:id])
    @enrollment.student.class_gyms << @class_gym
    
    redirect_to enrollments_path
  end
  
end
