# encoding: utf-8
class Enrollment < ActiveRecord::Base
  belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
  belongs_to :periodicity
  belongs_to :modality
  # belongs_to :registration_code
  
  validates :student, :modality, presence: true

  has_many :payments, as: :account, dependent: :destroy

  attr_accessible :start_date, :note, :value, :registration_fee, :discount, :student_id, :modality_id, :periodicity_id, :expiration_day, :active
  
  def expired?
    today = Date.today
    day_after = Date.new(today.year, today.month, self.expiration_day)
    day_before = day_after << 1
    
    # DESUSO    
    # !Enrollment.distinct.joins(:payments).where('payday BETWEEN ? AND ? AND active = true AND payments.individual_id = ?', 
            # day_before, day_after, self.student_id).exists?
            
    # Trazer todos os pagamentos que foram efetuados até a data de vencimento da matrícula corrente.
    return Payment.distinct.joins("INNER JOIN enrollments ON payments.account_id = enrollments.id AND 
      payments.account_type = \'Enrollment\' ").where('payday BETWEEN ? AND ? AND active = true AND payments.account_id = ?', 
        day_before, day_after, self.id).first
  end
  
end
