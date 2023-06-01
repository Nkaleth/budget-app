class PaymentsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params.merge(author: current_user))
    if @payment.save
      @categories = Category.where(id: params[:payment][:category_ids])
      @payment.categories << @categories
      redirect_to user_categories_path
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end
end
