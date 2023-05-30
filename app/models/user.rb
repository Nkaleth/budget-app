class User < ApplicationRecord
  has_many :payments, foreign_key: :author_id, dependent: :destroy
  has_many :categories, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true
end
