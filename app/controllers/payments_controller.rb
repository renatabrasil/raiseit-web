class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end
  
  def new
    @payment = Payment.new
  end
  
  def create
    @payment = Payment.new(params[:payment])
    
    respond_to do |format|
      if @payment.save
        format.html { redirect_to payments_path, notice: 'O Pagamento foi cadastrado com sucesso.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @payment = Payment.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @payment }
    end  
  end
  
  def edit
    @payment = Payment.find(params[:id])
  end
  
  def update
    @payment = Payment.find(params[:id])
    
    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to payments_path, :notice => 'O pagamento foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, :notice => 'O pagamento foi removido com sucesso.' }
      format.json { head :ok }
    end
  end  
end
