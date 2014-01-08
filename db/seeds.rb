# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Roles
  
  role1 = Role.new
  role1.name = 'ADMINISTRADOR'
  role1.save
  
  role2 = Role.new
  role2.name = 'FUNCIONARIO_SECRETARIA'
  role2.save
  
  role3 = Role.new
  role3.name = 'FUNCIONARIO_PROFESSOR'
  role3.save
  
  role4 = Role.new
  role4.name = 'ALUNO'
  role4.save
  
  # First user
  user = User.create!(:email=>'admin@admin.com',:username=>'admin',:password=>'admin123.')
  user.role_ids = 1
  user.save
  
  # Modality
  modality1 = Modality.create!(:name => 'Musculação')
  modality1.save
  
  # Type of Employees
  type_employee1 = TypeEmployee.create!(:name => 'Administração')
  type_employee1.save
  type_employee2 = TypeEmployee.create!(:name => 'Secretaria')
  type_employee2.save
  type_employee3 = TypeEmployee.create!(:name => 'Professor')
  type_employee3.save
  type_employee4 = TypeEmployee.create!(:name => 'Instrutor')
  type_employee4.save
  
  # Periodicity
  periodicity1 = Periodicity.create!(:description => 'ANUAL')
  periodicity1.save
  periodicity2 = Periodicity.create!(:description => 'MENSAL')
  periodicity2.save
  periodicity3 = Periodicity.create!(:description => 'SEMANAL')
  periodicity3.save
  periodicity4 = Periodicity.create!(:description => 'SEMESTRAL')
  periodicity4.save
  
  