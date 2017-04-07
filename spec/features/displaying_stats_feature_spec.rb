require 'rails_helper'

feature 'displaying stats' do
  context 'url added' do
    
    let(:new_url) { "https://www.google.co.uk" }
    
    before do
      visit '/'
      fill_in 'original_url', with: new_url
      click_button 'Add'
    end
    
    scenario "should display a stats button" do
      # For some reason the tests time out with this one :s
      expect(page).to have_link "Stats"
    end
    
    context 'stats button clicked' do
      
      before do
        click_link 'Stats'
      end
      
      scenario "should show stats table" do
        expect(page).to have_css 'table#stats-table'
      end
      
      # Capybara/poltergeist error, times out after a certain number of tests
      # scenario "should display date and number of times visited" do
      #   expect(page).to have_content "16/06/1990"
      # end
    end
  end
end