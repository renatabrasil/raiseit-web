# encoding: utf-8
class Instructor < Employee
  
  scope :instructor, -> { where(type: 'Instructor') }
  
  belongs_to :modalities, foreign_key: :modality_id
  
end
