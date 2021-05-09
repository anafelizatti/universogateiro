# frozen_string_literal: true

require 'rails_helper'

describe 'Visitor' do
  context 'when visit home page' do
    it 'index page' do
      visit root_path
      expect(current_path).to eq('/')
    end
  end
end
