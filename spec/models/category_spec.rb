require 'rails_helper'

RSpec.describe Category, type: :model do
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

    it 'has many payments through category_payments' do
      association = described_class.reflect_on_association(:payments)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:category_payments)
    end
  end

  describe 'validations' do
    let(:author) { User.create(name: 'Test', email: 'test@example.com', password: 'password') }
    subject { Category.new(name: 'Test', icon: 'test', author:) }

    it 'validates presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:icon]).to include("can't be blank")
    end
  end

  describe '#total_payments_amount' do
    let(:author) { User.create(name: 'Test', email: 'test@example.com', password: 'password') }
    let(:category) { Category.create(name: 'Test', icon: 'test', author:) }
    let!(:payment1) { Payment.create(name: 'Test1', amount: 10, author:) }
    let!(:payment2) { Payment.create(name: 'Test2', amount: 20, author:) }

    before do
      category.payments << payment1
      category.payments << payment2
    end

    it 'returns the total amount of payments for the category' do
      expect(category.total_payments_amount).to eq(30)
    end
  end

  describe '#payments_ordered_by_most_recent' do
    let(:author) { User.create(name: 'Test', email: 'test@example.com', password: 'password') }
    let(:category) { Category.create(name: 'Test', icon: 'test', author:) }
    let!(:payment1) { Payment.create(name: 'Test1', amount: 10, created_at: 1.day.ago, author:) }
    let!(:payment2) { Payment.create(name: 'Test2', amount: 20, created_at: Time.now, author:) }

    before do
      category.payments << payment1
      category.payments << payment2
    end

    it 'returns the payments ordered by most recent' do
      expect(category.payments_ordered_by_most_recent).to eq([payment2, payment1])
    end
  end
end
