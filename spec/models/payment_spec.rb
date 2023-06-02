require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'associations' do
    it 'belongs to author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
      expect(association.options[:class_name]).to eq('User')
    end

    it 'has many category_payments' do
      association = described_class.reflect_on_association(:category_payments)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many categories through category_payments' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:category_payments)
    end
  end

  describe 'validations' do
    let(:author) { User.create(name: 'Test', email: 'test@example.com', password: 'password') }
    subject { Payment.new(name: 'Test', amount: 10, author:) }

    it 'validates presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'validates numericality of amount greater than or equal to zero' do
      subject.amount = -1
      expect(subject).to_not be_valid
      expect(subject.errors[:amount]).to include('must be greater than or equal to 0')
    end
  end
end
