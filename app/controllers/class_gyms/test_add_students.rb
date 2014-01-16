class ClassGyms::AddStudentsController < ApplicationController
  
  # include Wicked::Wizard
  
  # steps :select_class, :insert_student, :confirm_class
  
  # Showing sequential views 
  def show
    case step
    when :insert_student
      # # @class_gyms = ClassGym.all
    # when :insert_student
#       
    # when :confirm_class
#       
    end
    render_wizard      
  end
  
  def index
    
  end
  
  def new
    
  end
  
  def direct_form
    #@class_gyms = ClassGym.all
    @class_gym = ClassGym.new
    puts "entrou direct form"
    respond_to do |format|
      format.html # select_class.html.erb
      format.json { render :json => @class_gyms }
    end  
    # redirect_to wizard_path(steps.first)
  end
  
  def select_class
    puts "entrou aqui select class"
    @class_gym = ClassGym.find(params[:class_gym_id])
  end
end
