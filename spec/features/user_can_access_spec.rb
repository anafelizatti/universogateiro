# frozen_string_literal: true

require 'rails_helper'

describe 'Visitor' do
  context 'when visit home page and access menu bar' do
    it 'index page' do
      visit root_path
      expect(page).to have_link('Fórum')
      expect(page).to have_link('Produtos')
      expect(page).to have_link('Indicaí')
      expect(page).to have_link('Curiosicats')
      expect(page).to have_link('ONGs - Adore ou Ajude um miau!')
    end
  end
end