class ClassStepsController < ApplicationController
  include Wicked::Wizard
  
  steps :class, :add_students
  
  def show
    @class_gym = ClassGym.find(session[:class_id])
    @students = Student.joins("JOIN enrollments ON enrollments.student_id = "+
      "people.id AND enrollments.modality_id = "+@class_gym.modality.id.to_s+
      " LEFT JOIN class_gyms_people ON (class_gyms_people.student_id = people.id) ").
        where("people.id NOT IN (SELECT class_gyms_people.student_id FROM "+
        "class_gyms_people WHERE class_gyms_people.class_gym_id = "+@class_gym.id.to_s+")")
    
    render_wizard
  end
  
  
end
