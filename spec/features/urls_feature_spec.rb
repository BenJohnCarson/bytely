require 'rails_helper'

feature 'urls' do
  context 'visiting landing page' do
    
    before do
      visit '/'
    end
    
    scenario 'should  disply title Bytley' do
      expect(page).to have_content 'Bytely'
    end
    
    scenario "should display url input" do
      expect(page).to have_field 'original_url'
    end
    
    scenario "should display add button" do
      expect(page).to have_button 'Add'
    end
  end
end