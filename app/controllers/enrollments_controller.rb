class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
    # @vencimentos = Payment.where({ name: "Joe", email: "joe@example.com" })
    #@vencimentos = Payment.where(individual_id: author)
  end
end
