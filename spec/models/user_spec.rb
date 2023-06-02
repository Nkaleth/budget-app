require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many payments' do
      association = described_class.reflect_on_association(:payments)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq(:author_id)
      expect(association.options[:dependent]).to eq(:destroy)
    end

    it 'has many categories' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq(:author_id)
      expect(association.options[:dependent]).to eq(:destroy)
    end
  end

  describe 'validations' do
    subject { User.new(name: 'Test', role: 'author') }

    it 'validates presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of role' do
      subject.role = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:role]).to include("can't be blank")
    end

    it 'validates inclusion of role in array' do
      subject.role = 'invalid'
      expect(subject).to_not be_valid
      expect(subject.errors[:role]).to include('is not included in the list')
    end
  end

  describe '#author?' do
    let(:user) { User.new(role: role) }

    context 'when the user is an author' do
      let(:role) { 'author' }

      it 'returns true' do
        expect(user.author?).to be true
      end
    end

    context 'when the user is not an author' do
      let(:role) { 'editor' }

      it 'returns false' do
        expect(user.author?).to be false
      end
    end
  end

  describe '#set_default_role' do
    context 'when the user is a new record' do
      let(:user) { User.new }

      it 'sets the default role to author' do
        expect(user.role).to eq('author')
      end
    end

    context 'when the user is not a new record' do
      let(:user) { User.create(name: 'Test', role: 'editor') }

      it 'does not change the role' do
        expect(user.role).to eq('editor')
      end
    end
  end
end
