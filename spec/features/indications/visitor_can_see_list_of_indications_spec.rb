require 'rails_helper'
# frozen_string_literal: true

describe 'indications' do
  context 'when visit indications index' do
    it 'from index page' do
      visit root_path
      click_on 'Indicaí'
      expect(page).to have_current_path('/indications')
    end

    it 'from nav bar' do
      visit root_path
      click_on 'Indicaí'
      expect(page).to have_current_path('/indications')
    end
  end
end
