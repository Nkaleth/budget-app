class CategoryPayment < ApplicationRecord
  belongs_to :category
  belongs_to :payment
end
