class ClassGyms::AddStudentsController < ApplicationController
  
  
  def select_students
    @class_gym = ClassGym.find(params[:class_gym_id])
    # @enrollments = Enrollment.all.where(['modality_id = ?', @class_gym.modality.id])
    
    @students = Student.joins("JOIN enrollments ON enrollments.student_id = "+
      "people.id AND enrollments.modality_id = "+@class_gym.modality.id.to_s+
      " LEFT JOIN class_gyms_people ON (class_gyms_people.student_id = people.id) ").
        where("people.id NOT IN (SELECT class_gyms_people.student_id FROM "+
        "class_gyms_people WHERE class_gyms_people.class_gym_id = "+@class_gym.id.to_s+")")
  end
  
  def insert_student
    @class_gym = ClassGym.find(params[:class_gym_id])
    @students = Student.find(params[:student_ids])
    
    @students.each do |student|
     @class_gym.students << student
    end
    
        @students = Student.joins("JOIN enrollments ON enrollments.student_id = "+
      "people.id AND enrollments.modality_id = "+@class_gym.modality.id.to_s+
      " LEFT JOIN class_gyms_people ON (class_gyms_people.student_id = people.id) ").
        where("people.id NOT IN (SELECT class_gyms_people.student_id FROM "+
        "class_gyms_people WHERE class_gyms_people.class_gym_id = "+@class_gym.id.to_s+")")
    
    render 'select_students'
    # respond_to do |format|
      # format.html { redirect_to add_student3_path, :notice => 'As mensagens foram removidas com sucesso.' }
      # format.json { head :ok }
    # end
  end
  
  def validate_class
    
  end  
  
  def confirm_class
    @class_gym = ClassGym.find(params[:class_gym_id])
    @class_gym.attributes = {:open => 'false'}
    
    respond_to do |format|
      if @class_gym.update_attributes(params[:class_gym])
        format.html { redirect_to class_gyms_path, notice: 'Turma fechada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @class_gym.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def index
    @class_gym = ClassGym.find(params[:class_gym_id])
    #Payment.where(['individual_id = ? AND paid = ? AND expiration_date <= ?', self.student_id, false, Date.today])
  end
  
  
end
