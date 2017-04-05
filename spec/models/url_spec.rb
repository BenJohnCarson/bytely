require 'rails_helper'

RSpec.describe Url, type: :model do
  
  let(:url) { build(:url) }
  
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
    url1 = create(:url, original_url: "www.google.com")
    url2 = build(:url, original_url: "www.google.com")
    expect(url2.valid?).to be false
  end
  
  describe "#encode" do
    it "takes an integer and bijectively encodes it to a string" do
      expect(url.encode(100)).to eq "bM"
    end
  end
  
  describe "#decode" do
    it "takes a string and returns the original integer" do
      expect(url.decode("bM")).to eq 100
    end
  end
end
