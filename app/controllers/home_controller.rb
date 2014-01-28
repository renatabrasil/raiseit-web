class HomeController < ApplicationController
  
  def index

    # Pro aplicativo
    # if user_signed_in?
      # if current_user.id == User::ADMIN_ROOT_ID
        # sql + "AND p.individual_id = " + current_user.id.to_s
      # end
    # end
    
    
    # Colocar o id dos que tão vencidos dentro de um array e passar na session
    @enrollments = Enrollment.all
    @size_expired_payments = 0
    @enrollments.each do |enrollment|
     if enrollment.expired?
       @size_expired_payments = @size_expired_payments+1 
     end 
    end

  end
end
