require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  
  describe "GET #index" do

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders a json object" do
      get :index
      expect(response.content_type).to include "application/json"
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      context "with a new url" do
        
        it "creates a new url entry" do
          expect{
            post :create, params: { url: attributes_for(:url) }
          }.to change(Url, :count).by(1)
        end
        
        it "renders the url as a json" do
          post :create, params: { url: attributes_for(:url) }
          expect(response.content_type).to include "application/json"
        end
      end
      
      context "with a url that is already in the database" do
        
        before :each do
          @url = create(:url, original_url: 'google.com')
        end
        
        it "does not create a new url entry" do
          expect{
            post :create, params: { url: attributes_for(:url, original_url: 'google.com') }
          }.to_not change(Url, :count)
        end
        
        it "response body is empty" do
          post :create, params: { url: attributes_for(:url, original_url: 'google.com') }
          expect(response.body).to eq ""
        end
      end
    end
    
    context "with invalid attributes" do
      
      it "does not create a new url entry" do
        expect{
          post :create, params: { url: attributes_for(:url, original_url: nil) }
        }.to_not change(Url, :count)
      end
    end
  end
  
  describe "GET #show" do
    
    before :each do
      @url = create(:url, original_url: "google.com")
      @url.create_short_code(@url.id)
      @url.save
    end
    
    it "redirects to the original url if params contain short_code" do
      get :show, params: { short_code: @url.short_code }
      expect(response).to redirect_to(@url.original_url)
    end
    
    it "renders a json if params contain url id" do
      get :show, params: { id: @url.id }
      expect(response.content_type).to include "application/json"
    end
    
    it "has a 302 status code" do
      get :show, params: { short_code: @url.short_code }
      expect(response.status).to eq(302)
    end
  end
end
