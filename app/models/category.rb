class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_payments
  has_many :payments, through: :category_payments

  validates :name, presence: true
  validates :icon, presence: true

  def total_payments_amount
    payments.sum(:amount)
  end

  def payments_ordered_by_most_recent
    payments.order(created_at: :desc)
  end
end
