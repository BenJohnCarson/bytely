require 'rails_helper'

RSpec.describe Url, type: :model do
  
  let(:url)       { build(:url) }
  let(:saved_url) { create(:url) }
  
  it "valid with a valid url" do
    expect(url).to be_valid
  end
  
  it "invalid without a url" do
    empty_url = build(:url, original_url: nil)
    expect(empty_url.valid?).to be false
  end
  
  it "invalid with an invalid url" do
    invalid_url = build(:url, original_url: "123")
    expect(invalid_url.valid?).to be false
  end
  
  it "invalid if url already exists in database" do
    url1 = create(:url, original_url: "www.facebook.com")
    url2 = build(:url, original_url: "www.facebook.com")
    expect(url2.valid?).to be false
  end
  
  describe "#create_short_code" do
    it "encodes it's id into a short code" do
      expect(saved_url.create_short_code(10)).to eq "k"
    end
  end
  
  describe "#create_short_url" do
    it "creates a short url from current domain and url id" do
      domain = "http://domain.com/"
      expect(saved_url.create_short_url(domain, 10)).to eq "#{domain}/k"
    end
  end
  
  describe "#init" do
    it "sets visits to 0 if it's not already set" do
      expect(saved_url.init).to eq 0
    end
    
    it "leaves visits unchanged if already set" do
      saved_url.add_visit
      expect(saved_url.init).to eq 1
    end
  end
  
  describe "#add_visit" do
    
    before do
      Timecop.freeze(Time.now)
    end
    
    it "increments visits" do
      expect{ saved_url.add_visit }.to change{ saved_url.visits }.by(1)
    end
    
    it "adds a date to date_last_visit" do
      saved_url.add_visit
      expect(saved_url.date_last_visit).to eq Date.today
    end
  end
end
