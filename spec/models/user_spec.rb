require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:payments).with_foreign_key(:author_id).dependent(:destroy) }
    it { should have_many(:categories).with_foreign_key(:author_id).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:role) }
    it { should validate_inclusion_of(:role).in_array(%w[admin editor author]) }
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
