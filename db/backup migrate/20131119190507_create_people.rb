class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      # Specify the type
      t.string :type
      
      # Attributes
      t.string :name, limit: 300
      t.string :cpf, limit: 30
      t.string :cnpj, limit: 30
      t.string :rg, limit: 30
      t.string :inscricao_estadual, limit: 80
      t.string :email, limit: 200
      t.string :gender, limit: 1
      t.string :phone1, limit: 20
      t.string :phone2, limit: 20
      t.string :enrollment, limit: 30
      
      # Foreign key
      #t.integer :corretor_id
      t.belongs_to :type_employee
      t.belongs_to :modality
      
      t.timestamps
    end
    
    #adicionando o indice
    # add_index :people, [:id, :type]
  end
end
