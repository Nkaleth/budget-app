require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
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

  scenario 'displays a list of categories with their total payments' do
    visit user_categories_path(user)

    expect(page).to have_content('Test1')
    expect(page).to have_content('10.0$')
    expect(page).to have_content('Test2')
    expect(page).to have_content('20.0$')
  end

  scenario 'displays a link to create a new category' do
    visit user_categories_path(user)

    expect(page).to have_link('ADD A NEW CATEGORY', href: new_user_category_path(user))
  end
end
