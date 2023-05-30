class CategoriesController < ApplicationController
  def index
    @categories = Category.accessible_by(current_ability)
  end
end
