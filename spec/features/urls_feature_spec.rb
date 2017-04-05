require 'rails_helper'

feature 'urls' do
  context 'visiting landing page' do
    scenario 'should  disply title Bytley' do
      visit '/'
      expect(page).to have_content 'Bytely'
    end
  end
end