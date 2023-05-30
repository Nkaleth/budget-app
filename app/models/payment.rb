class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_payments
  has_many :payments, through: :category_payments
end
