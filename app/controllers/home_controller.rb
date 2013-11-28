class HomeController < ApplicationController
  def index

    sql = "SELECT COUNT(*) FROM payments p WHERE p.expiration_date <= " +
    "CURRENT_TIMESTAMP AND p.account_type LIKE 'Enrollment' AND " +
    " p.paid = 'false' "
    
    # Pro aplicativo
    # if user_signed_in?
      # if current_user.id == User::ADMIN_ROOT_ID
        # sql + "AND p.individual_id = " + current_user.id.to_s
      # end
    # end

    @size_expired_payments = Payment.count_by_sql sql

  end
end
