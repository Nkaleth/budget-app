require 'rails_helper'

RSpec.describe 'Payments', type: :feature do
  let(:user) { User.create(name: 'Test', email: 'test@example.com', password: 'password') }
  let!(:category1) { Category.create(name: 'Test1', icon: 'test1.png', author: user) }
  let!(:category2) { Category.create(name: 'Test2', icon: 'test2.png', author: user) }
  let!(:payment1) { Payment.create(name: 'Test1', amount: 10, author: user) }
  let!(:payment2) { Payment.create(name: 'Test2', amount: 20, author: user) }

  before do
    category1.payments << payment1
    category2.payments << payment2
    login_as(user)
  end

  scenario 'displays a list of payments with their categories' do
    visit user_payments_path(user)

    expect(page).to have_content('Test1')
    expect(page).to have_content('10.0 $')
    expect(page).to have_content('Test2')
    expect(page).to have_content('20.0 $')
    expect(page).to have_content('Categories: Test1')
    expect(page).to have_content('Categories: Test2')
  end
end
