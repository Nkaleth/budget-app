class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @category_totals = @categories.map do |category|
      payments = category.payments
      total = payments.sum(:amount)
      { name: category.name, icon: category.icon, total: }
    end
  end
end
