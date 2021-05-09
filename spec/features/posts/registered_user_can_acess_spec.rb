require 'rails_helper'
context 'when user do registration' do
  it 'can acess post page' do
    user = User.create!(email: 'user1@email.com.br', password: '123456')
    login_as(user)

    visit root_path

    click_on 'Fórum'
    expect(page).to have_current_path('/posts')
  end
end
