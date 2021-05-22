require 'rails_helper'
context 'when user do registration' do
  it 'can acess post page' do
    user = User.create!(email: 'user1@email.com.br', password: '123456')
    login_as(user)

    visit root_path

    click_on 'Fórum'
    expect(page).to have_current_path('/posts')
  end

  it 'can create a post' do
    user = User.create!(email: 'user1@email.com.br', password: '123456')
    login_as(user)

    visit posts_path
    click_on 'Novo Tópico'

    fill_in 'Title', with: 'RANDON THING'
    fill_in 'Content', with: 'coment on RANDON THING'
    click_on 'Criar'

    visit posts_path
    expect(page).to have_link('RANDON THING')
  end

  it 'can see options of a post' do
    user = User.create!(email: 'user1@email.com.br', password: '123456')
    login_as(user)

    visit posts_path
    click_on 'Novo Tópico'

    fill_in 'Title', with: 'RANDON THING'
    fill_in 'Content', with: 'coment on RANDON THING'
    click_on 'Criar'

    visit posts_path
    expect(page).to have_link('RANDON THING')

    click_on 'RANDON THING'
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  end

  it 'can edit a post' do
    user = create(:user)
    login_as(user)
    visit posts_path

    click_on 'Novo Tópico'

    fill_in 'Title', with: 'RANDON THING'
    fill_in 'Content', with: 'coment on RANDON THING'
    click_on 'Criar'

    visit posts_path
    expect(page).to have_link('RANDON THING')

    click_on 'RANDON THING'
    click_on 'Editar'
    fill_in 'Title', with: 'Edited'
    click_on 'Criar'
    expect(page).to have_content('Edited')
  end

  it 'can delete a post' do
    user = create(:user)
    login_as(user)
    visit posts_path

    click_on 'Novo Tópico'

    fill_in 'Title', with: 'RANDON THING'
    fill_in 'Content', with: 'coment on RANDON THING'
    click_on 'Criar'

    visit posts_path
    expect(page).to have_link('RANDON THING')

    click_on 'RANDON THING'
    click_on 'Deletar'

    visit posts_path
    expect(page).not_to have_content('RANDON THING')
  end
end
