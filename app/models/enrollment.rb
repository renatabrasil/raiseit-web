# encoding: utf-8
class Enrollment < ActiveRecord::Base
  belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
  belongs_to :periodicity
  belongs_to :modality
  # belongs_to :registration_code
  
  validates :student, :modality, presence: true

  has_many :payments, as: :account, dependent: :destroy

  attr_accessible :start_date, :note, :value, :registration_fee, :discount, :student_id, :modality_id, :periodicity_id, :expiration_day
  
  def expired?
    # DESUSO
    # !Enrollment.joins('INNER JOIN payments ON payments.account_id = enrollments.id AND 
      # "payments"."account_type" = \'Enrollment\' ').where('
      # (SELECT EXTRACT (MONTH FROM DATE (payments.payday))) = ? AND active = true AND (SELECT EXTRACT (DAY FROM DATE (payments.payday))) <= ?', Date.today.month, self.expiration_day).exists?
    
    today = Date.today
    day_after = Date.new(today.year, today.month, self.expiration_day)
    day_before = day_after << 1
    
    # Trazer todos os pagamentos que foram efetuados até a data de vencimento da matrícula corrente.
     return !Enrollment.distinct.joins(:payments).where('payday BETWEEN ? AND ? AND active = true AND payments.individual_id = ?', 
            day_before, day_after, self.student_id).exists?
  end
  
  def expired_payment
    
    return []
    # Payment.where(['individual_id = ? AND payday <= ?', self.student_id, Date.today])
    #return Payment.where(['individual_id = ? AND paid = ? AND expiration_date <= ?', self.student_id, false, Date.today])
  end
  
  def size_expired_payment
    
    #return self.expired_payment.size
  end

end
