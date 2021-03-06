# encoding: utf-8
class Enrollment < ActiveRecord::Base
  belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
  belongs_to :periodicity
  belongs_to :gym_class
  
  validates :student, :start_date, :registration_fee, :periodicity, :gym_class, 
            :value,  presence: true
  
  validates :note, :length => {:maximum => 500, 
                               :message => 'too big, must be lower' }
                               

  has_many :payments, as: :account, dependent: :destroy

  attr_accessible :start_date, :note, :value, :registration_fee, :discount, 
                  :student_id, :modality_id, :periodicity_id, :expiration_day, 
                  :active, :gym_class, :gym_class_id
  
  def expired?
    today = Date.today
    day_after = Date.new(today.year, today.month, self.expiration_day)
    day_before = day_after << 1
    
    # DESUSO    
    # !Enrollment.distinct.joins(:payments).where('pay_day BETWEEN ? AND ? AND active = true AND payments.individual_id = ?', 
            # day_before, day_after, self.student_id).exists?
            
    # Trazer todos os pagamentos que foram efetuados até a data de vencimento da matrícula corrente.
    return Payment.distinct.joins("INNER JOIN enrollments ON payments.account_id = enrollments.id AND 
      payments.account_type = \'Enrollment\' ").where('pay_day BETWEEN ? AND ? AND active = true AND payments.account_id = ?', 
        day_before, day_after, self.id).first
  end
  
end
