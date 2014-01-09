class ClassGymsController < ApplicationController
  
  def show
    @class_gym = ClassGym.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @class_gym }
    end  
  end
  
  def index
    @class_gyms = ClassGym.all
  end
  
  def new
    @class_gym = ClassGym.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @class_gym }
    end
  end
  
  def create
    @class_gym = ClassGym.new(params[:class_gym])
    
    respond_to do |format|
      if @class_gym.save
        format.html { redirect_to class_gyms_path, notice: 'A turma foi cadastrada com sucesso.' }
        format.json { render json: @class_gym, status: :created, location: @class_gym }
      else
        format.html { render action: "new" }
        format.json { render json: @class_gym.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @class_gym = ClassGym.find(params[:id])
  end
  
  def update
    @class_gym = ClassGym.find(params[:id])
    
    respond_to do |format|
      if @class_gym.update_attributes(params[:class_gym])
        format.html { redirect_to class_gyms_path, :notice => 'A turma foi atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @class_gym.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @class_gym = ClassGym.find(params[:id])
    
    @class_gym.destroy

    respond_to do |format|
        format.html { redirect_to class_gyms_url, notice: 'Turma removida com sucesso.'  }
        format.json { head :no_content }
    end  
  end
  
  def include_student
    @class_gym = ClassGym.find(params[:id])
    
    @students = Student.joins("JOIN enrollments ON enrollments.student_id = "+
      "people.id AND enrollments.modality_id = "+@class_gym.modality.id.to_s+
      " LEFT JOIN class_gyms_people ON (class_gyms_people.student_id = people.id) ").
        where("people.id NOT IN (SELECT class_gyms_people.student_id FROM "+
        "class_gyms_people WHERE class_gyms_people.class_gym_id = "+@class_gym.id.to_s+")")
  end
  
  def insert_student
    @class_gym = ClassGym.find(params[:id])
    puts @class_gym.id.to_s
    @students = Student.find(params[:student_ids])
    
    @students.each_with_index do |student,i|
     @class_gym.students << student
    end
    
    respond_to do |format|
      format.html { redirect_to include_student_class_gym_path(@class_gym), notice: 'User was successfully created.' }
      format.js   {}
      format.json { render json: @class_gym.student, status: :created, location: @class_gym }
    end
  end
  
  def delete_student
    @class_gym = ClassGym.find(params[:id])
    
    @class_gym.students.each do |student|
      if student.id == params[:student_id].to_i
        puts student.id.to_s
        @student = student
        @class_gym.students.delete(student)
      end
    end
    
    puts @student.name

    respond_to do |format|
      format.html { redirect_to select_students_path(@class_gym.id),
        notice: 'Aluno removido com sucesso na turma.' }
        format.js {}
        format.json { render json: @student, status: :created, location: @student }
      # format.html { redirect_to administrativo_mensagems_url, :notice => 'As mensagens foram removidas com sucesso.' }
      # format.json { head :ok }
    end
  end
  
  def confirm
    @class_gym = ClassGym.find(params[:id])
    
    respond_to do |format|
      format.html # confirm.html.erb
      format.json { render json: @class_gym }
    end
  end
  
  def finish_class
    @class_gym = ClassGym.find(params[:id])
    @class_gym.attributes = {:open => 'false'}
    
    respond_to do |format|
      if @class_gym.update_attributes(params[:class_gym])
        format.html { redirect_to class_gyms_path, notice: 'Turma fechada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
end
