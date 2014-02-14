class PaymentsController < ApplicationController
  load_and_authorize_resource
  
  def index
    
  end
  
  def show
    @payment = Payment.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @payment }
    end  
  end
end
