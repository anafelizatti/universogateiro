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
    click_on 'New Post'

    fill_in "Title", with: "Random thing"
    fill_in "Content", with: "coment on random thing"
    click_on 'Create Post'

    visit posts_path
    expect(page).to have_link('Random thing')

  end

  it 'can see options of a post' do
    user = User.create!(email: 'user1@email.com.br', password: '123456')
    login_as(user)

    visit posts_path
    click_on 'New Post'

    fill_in "Title", with: "Random thing"
    fill_in "Content", with: "coment on random thing"
    click_on 'Create Post'

    visit posts_path
    expect(page).to have_link('Random thing')

    click_on 'Random thing'
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delet')
  end

  it 'can edit a post' do
    user = create(:user)
    login_as(user)
    visit posts_path

    click_on 'New Post'

    fill_in "Title", with: "Random thing"
    fill_in "Content", with: "coment on random thing"
    click_on 'Create Post'

    visit posts_path
    expect(page).to have_link('Random thing')

    click_on 'Random thing'
    click_on 'Edit'
    fill_in "Title", with: "Edited"
    click_on 'Update Post'
    expect(page).to have_content('Edited')
  end

  it 'can delete a post' do
    user = create(:user)
    login_as(user)
    visit posts_path

    click_on 'New Post'

    fill_in "Title", with: "Random thing"
    fill_in "Content", with: "coment on random thing"
    click_on 'Create Post'

    visit posts_path
    expect(page).to have_link('Random thing')

    click_on 'Random thing'
    click_on 'Delete'
    
    visit posts_path
    expect(page).to_not have_content('Random thing')
  end

end
