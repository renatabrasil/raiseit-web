# This controller is for the student view, this is the student environment  
class StudentController < ApplicationController
  def home
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    
    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to student_home_path(@student), :notice => 'Atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  def payments
    @student = Student.find(params[:id])
    @payments = @student.payments
  end

  def classes
    @student = Student.find(params[:id])
    @class_gyms = @student.class_gyms
  end

  def workout_sheet
    @student = Student.find(params[:id])
    @workout_sheet = @student.workout_sheets.last
  end
end
