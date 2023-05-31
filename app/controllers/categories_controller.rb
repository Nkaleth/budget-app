class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @category_totals = @categories.map do |category|
      payments = category.payments
      total = payments.sum(:amount)
      { name: category.name, icon: category.icon, id: category.id, total: }
    end
  end

  def show
    @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params.merge(author: current_user))

    if @category.save
      redirect_to user_categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
