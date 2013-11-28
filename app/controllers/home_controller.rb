class HomeController < ApplicationController
  def index
    date1 = DateTime.parse(Time.now.to_s)
    format1 = "%Y-%m-%d"
    str_date = date1.strftime(format1)
    @size_expired_payments = Payment.count_by_sql " SELECT COUNT(*) FROM payments p WHERE p.expiration_date <= " + str_date.to_s + " and p.account_type like Enrollment "
    
  end
end
