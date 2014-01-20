# encoding: utf-8
class Enrollment < ActiveRecord::Base
  belongs_to :student, :class_name => 'Student', :foreign_key => 'student_id'
  belongs_to :periodicity
  belongs_to :modality
  # belongs_to :registration_code

  has_many :payments, as: :account, dependent: :destroy

  attr_accessible :start_date, :note, :value, :registration_fee, :discount, :student_id, :active, :modality_id
  def expired_payment
    return Payment.where(['individual_id = ? AND paid = ? AND expiration_date <= ?', self.student_id, false, Date.today])
  end
  
  def size_expired_payment
    return self.expired_payment.size
  end

end
