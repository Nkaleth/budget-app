require 'rails_helper'

RSpec.describe CategoryPayment, type: :model do
  describe 'associations' do
    it 'belongs to category' do
      association = described_class.reflect_on_association(:category)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to payment' do
      association = described_class.reflect_on_association(:payment)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe '#create' do
    let(:author) { User.create(name: 'Test', email: 'test@example.com', password: 'password') }
    let(:category) { Category.create(name: 'Test', icon: 'test', author:) }
    let!(:payment1) { Payment.create(name: 'Test1', amount: 10, author:) }

    it 'creates a new CategoryPayment record' do
      cp = CategoryPayment.new(category_id: category.id, payment_id: payment1.id)
      expect(cp.save).to be true
      expect(CategoryPayment.count).to eq(1)
      cp.destroy
      expect(CategoryPayment.count).to eq(0)
    end
  end
end
