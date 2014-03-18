# This controller is for the student view, this is the student environment  
class StudentController < ApplicationController
  load_and_authorize_resource :class => "Student"
  
  def home
    @student = Student.find(params[:id])
    @how_many_students = EntryRecord.how_many_students?(Time.now)
    @how_many_female_students = EntryRecord.how_many_female_students?(Time.now)
    @how_many_male_students = EntryRecord.how_many_male_students?(Time.now)
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
    @graph_year_attendance = @student.graph_year_attendance(Date.today.year)
    @class_gyms = @student.class_gyms
  end

  def workout_sheet
    @student = Student.find(params[:id])
    @workout_sheet = @student.workout_sheets.last
  end
end
