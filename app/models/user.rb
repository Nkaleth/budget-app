class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :payments, foreign_key: :author_id, dependent: :destroy
  has_many :categories, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true
  validates :role, presence: true, inclusion: { in: %w[admin editor author] }
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= 'author'
  end
end
