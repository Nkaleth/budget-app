class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.includes(:payments).accessible_by(current_ability)
    @category_totals = @categories.map do |category|
      payments = category.payments
      total = payments.sum(:amount)
      { name: category.name, icon: category.icon, total: }
    end
  end
end
