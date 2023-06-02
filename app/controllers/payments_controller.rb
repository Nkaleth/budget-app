class PaymentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @payments
  end

  def new
    @category = Category.find(params[:category_id])
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params.merge(author: current_user))
    if @payment.save
      @category = Category.find(params[:category_id])
      @categories = Category.where(id: params[:payment][:category_ids]).where.not(id: @category.id)
      @payment.categories << @category unless @payment.categories.include?(@category)
      @categories.each do |category|
        @payment.categories << category unless @payment.categories.include?(category)
      end
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
