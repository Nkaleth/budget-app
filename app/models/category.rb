class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_payments
  has_many :payments, through: :category_payments

  validates :name, presence: true
  validates :icon, presence: true
end
