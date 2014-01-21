class EnrollmentsController < ApplicationController
  def index
    @search = Enrollment.joins(:student).search(params[:q])
    @enrollments = @search.result(distinct: true)
    
    # @enrollments = Enrollment.all
    # @vencimentos = Payment.where({ name: "Joe", email: "joe@example.com" })
    # @vencimentos = Payment.where(individual_id: author)
  end
end
