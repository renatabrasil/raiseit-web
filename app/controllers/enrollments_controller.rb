# encoding: utf-8
class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
    # @vencimentos = Payment.where({ name: "Joe", email: "joe@example.com" })
    #@vencimentos = Payment.where(individual_id: author)
  end
  
  def new
    @enrollment = Enrollment.new
    @enrollment.periodicity = Periodicity.find(Periodicity::MENSAL)
    @today = Date.today
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enrollment }
    end
  end
  
  def create
    @enrollment = Enrollment.new(params[:enrollment])
    
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollments_path, notice: 'A matrícula foi efetuada com sucesso.' }
        format.json { render json: @enrollment, status: :created, location: @enrollment }
      else
        format.html { render action: "new" }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
end
