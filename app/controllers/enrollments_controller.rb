# encoding: utf-8
class EnrollmentsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @search = Enrollment.joins(:student).search(params[:q])
    @enrollments = @search.result(distinct: true, :order => 'created_at DESC')
    
    # @enrollments = Enrollment.all
    # @vencimentos = Payment.where({ name: "Joe", email: "joe@example.com" })
    # @vencimentos = Payment.where(individual_id: author)
  end
  
  def edit
    @enrollment = Enrollment.find(params[:id])
    @gym_classes = GymClass.where(modality_id: @enrollment.gym_class.modality.id)
  end
  
  def update
    @enrollment = Enrollment.find(params[:id])
    
    previous_gym_class = @enrollment.gym_class
    
    respond_to do |format|
      if @enrollment.update_attributes(params[:enrollment])
        @enrollment.student.gym_classes << @enrollment.gym_class
        # Refresh student's gym_classes
        if(previous_gym_class.id != @enrollment.gym_class.id)
          @enrollment.student.gym_classes.delete(previous_gym_class)
         end
        format.html { redirect_to enrollment_path(@enrollment), :notice => 'A matrícula foi atualizada com sucesso.' }
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
        @enrollment.student.gym_classes << @enrollment.gym_class
        format.html { redirect_to enrollment_path(@enrollment), notice: 'A matrícula foi cadastrada com sucesso.' }
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
  
  def destroy
    @enrollment = Enrollment.find(params[:id])
    
    # @testes = GymClass.joins(:students).joins("LEFT JOIN enrollments ON enrollments.student_id = gym_classes_students.student_id").where("
      # enrolments.id = ?", @enrollment.id)
    
    @enrollment.student.gym_classes.delete(:all)
    @enrollment.destroy

    respond_to do |format|
        format.html { redirect_to enrollments_url, notice: 'Matrícula removida com sucesso.'  }
        format.json { head :no_content }
    end  
  end
  
end
