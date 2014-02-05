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
  
  ###################### Create the sheet for workouts #########################
  
  # Create the Model Workout Sheet DEFAULT
  model_workout_sheet = ModelWorkoutSheet.create(name: "Default")
  
  # Create the Physical Categories DEFAULT
  peitoral = PhysicalCategory.create(name: "PEITORAL") 
  dorsal = PhysicalCategory.create(name: "DORSAL")
  triceps = PhysicalCategory.create(name: "TRÍCEPS")
  biceps = PhysicalCategory.create(name: "BÍCEPS")
  ombro = PhysicalCategory.create(name: "OMBRO")
  anterior_coxa = PhysicalCategory.create(name: "ANTERIOR DA COXA")
  posterior_coxa = PhysicalCategory.create(name: "POSTERIOR DA COXA")
  gluteos= PhysicalCategory.create(name: "GLÚTEOS")
  panturrilha = PhysicalCategory.create(name: "PANTURRILHA")
  abdomen = PhysicalCategory.create(name: "ABDOMEN")
  atividade_aerobica = PhysicalCategory.create(name: "ATIVIDADE AERÓBICA")
  model_workout_sheet.physical_categories << PhysicalCategory.all
  
  # Create the workouts DEFAULT
  peitoral.workouts <<  Workout.create(description: "SUPINO RETO" )
  peitoral.workouts <<  Workout.create(description: "SUPINO INCLINADO")
  peitoral.workouts <<  Workout.create(description: "SUPINO COM HALT")
  peitoral.workouts <<  Workout.create(description: "SUPINO DECLINADO")
  peitoral.workouts <<  Workout.create(description: "CRUCIFIXO INCLINADO")
  peitoral.workouts <<  Workout.create(description: "CRUCIFIXO DECLINADO")
  peitoral.workouts <<  Workout.create(description: "CRUCIFIXO CROSS")
  peitoral.workouts <<  Workout.create(description: "PULL OVER")
  peitoral.workouts <<  Workout.create(description: "PARALELA")
  peitoral.workouts <<  Workout.create(description: "PECK DECK")

  dorsal.workouts <<  Workout.create(description: "PUXADA POR TRÁS") 
  dorsal.workouts <<  Workout.create(description: "PUXADA FRENTE")
  dorsal.workouts <<  Workout.create(description: "PUXADA REVERSA")
  dorsal.workouts <<  Workout.create(description: "REMADA MAQ")
  dorsal.workouts <<  Workout.create(description: "REMADA BAIXO")
  dorsal.workouts <<  Workout.create(description: "REMADA UNILATERAL")
  dorsal.workouts <<  Workout.create(description: "REMADA CURVADA")
  dorsal.workouts <<  Workout.create(description: "PULL OVER")
  dorsal.workouts <<  Workout.create(description: "PULL DOWN")
  
  triceps.workouts <<  Workout.create(description: "PULLEY REVERSO")
  triceps.workouts <<  Workout.create(description: "TRÍCEPS NO PULEY")
  triceps.workouts <<  Workout.create(description: "TRÍCEPS NA TESTA")
  triceps.workouts <<  Workout.create(description: "FUNDO INVERSO")
  triceps.workouts <<  Workout.create(description: "SUPINO FECHADO")
  triceps.workouts <<  Workout.create(description: "TRÍCEPS FRANCESA")
  triceps.workouts <<  Workout.create(description: "PARALELA")
  triceps.workouts <<  Workout.create(description: "TRÍCEPS CORDA")
  
  biceps.workouts <<  Workout.create(description: "ROSCA ALTERNADA")
  biceps.workouts <<  Workout.create(description: "ROSCA DIRETA")
  biceps.workouts <<  Workout.create(description: "ROSCA CONCENTRADA")
  biceps.workouts <<  Workout.create(description: "BANCO SCOTT")
  biceps.workouts <<  Workout.create(description: "ROSCA INVERSA")
  biceps.workouts <<  Workout.create(description: "ROSCA PUNHO")
  biceps.workouts <<  Workout.create(description: "ROSCA MARTELO")
  
  ombro.workouts <<  Workout.create(description: "ELEVAÇÃO LATERAL")
  ombro.workouts <<  Workout.create(description: "ELEVAÇÃO FRONTAL")
  ombro.workouts <<  Workout.create(description: "DESENV. FRENTE")
  ombro.workouts <<  Workout.create(description: "DESENV. TRÁS")
  ombro.workouts <<  Workout.create(description: "DESENV. C/ HALT")
  ombro.workouts <<  Workout.create(description: "REMADA ALTA")
  ombro.workouts <<  Workout.create(description: "CRUCIFIXO INVERSO")
  ombro.workouts <<  Workout.create(description: "ENCOLHIMENTO")
  
  anterior_coxa.workouts <<  Workout.create(description: "MESA EXTENSORA")
  anterior_coxa.workouts <<  Workout.create(description: "LEG PRESS")
  anterior_coxa.workouts <<  Workout.create(description: "HACK MACHINE")
  anterior_coxa.workouts <<  Workout.create(description: "AGACHAMENTO")
  anterior_coxa.workouts <<  Workout.create(description: "ADUÇÃO")
  anterior_coxa.workouts <<  Workout.create(description: "ABDUÇÃO")
  
  posterior_coxa.workouts <<  Workout.create(description: "FLEXORA VERTICAL")
  posterior_coxa.workouts <<  Workout.create(description: "FLEXORA HORIZONTAL")
  posterior_coxa.workouts <<  Workout.create(description: "STIFF")
  posterior_coxa.workouts <<  Workout.create(description: "AVANÇO")
  posterior_coxa.workouts <<  Workout.create(description: "ADUÇÃO")
  posterior_coxa.workouts <<  Workout.create(description: "ABDUÇÃO")
  
  gluteos.workouts <<  Workout.create(description: "GLÚTEO NO CROSS")
  gluteos.workouts <<  Workout.create(description: "GLÚTEO NA GUIADA")
  
  panturrilha.workouts <<  Workout.create(description: "PANTURRILHA 90\xC2\xB0")
  panturrilha.workouts <<  Workout.create(description: "PANTURRILHA EM PÉ")
  
  abdomen.workouts <<  Workout.create(description: "SUPRA UMBILICAL")
  abdomen.workouts <<  Workout.create(description: "INFRA UMBILICAL")
  abdomen.workouts <<  Workout.create(description: "OBLÍQUO")
  abdomen.workouts <<  Workout.create(description: "LOMBAR*")
  
  atividade_aerobica.workouts <<  Workout.create(description: "ESTEIRA")
  atividade_aerobica.workouts <<  Workout.create(description: "BICICLETA")
  atividade_aerobica.workouts <<  Workout.create(description: "CORRIDA")
  
  #############################################################################
  
    
