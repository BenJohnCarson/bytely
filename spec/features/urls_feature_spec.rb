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
  
  context "after adding a url" do
    
    let(:new_url) { "https://www.google.co.uk" }
    
    before do
      visit '/'
      fill_in 'original_url', with: new_url
      click_button 'Add'
    end
    
    scenario "should display original url" do
      expect(page).to have_content new_url
    end
    
    scenario "should display short url" do
      url = URI.parse(current_url)
      expect(page).to have_text "#{url}"
    end
    
    xscenario "clicking on short url takes you to original website" do # TODO test keeps timing out, alternative test redirect in controller
      url = URI.parse(current_url)
      click_link("#{url}b")
      expect(page.current_url).to eq new_url
    end
  end
end