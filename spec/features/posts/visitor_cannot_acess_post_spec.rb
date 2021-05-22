# frozen_string_literal: true

require 'rails_helper'

describe 'Visitor' do
  context 'when visitor is not logged in (page)' do
    it 'from index page' do
      visit root_path
      click_on 'Me leve ao fórum'
      expect(page).to have_current_path('/users/sign_in')
      expect(page).to have_content('Sign up')
    end

    it 'from nav bar' do
      visit root_path
      click_on 'Fórum'
      expect(page).to have_current_path('/users/sign_in')
      expect(page).to have_content('Sign up')
    end
  end
end
