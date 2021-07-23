require 'rails_helper'

RSpec.describe Client, type: :model do
  before :each do
    @client = build :client
  end

  context "validations" do
    it "should have a name" do
      @client.name = nil
      expect(@client).to be_invalid
    end

    it "should be invalid if name blank" do
      @client.name = "    "
      expect(@client).to be_invalid
    end

    it "should be invalid if name > 40 characters" do
      @client.name = "a" * 41
      expect(@client).to be_invalid
    end

    it "should be invalid if contact > 40 characters" do
      @client.contact = "a" * 41
      expect(@client).to be_invalid
    end

    it "should be invalid if email > 40 characters" do
      @client.email = "a" * 32 + "@test.com"
      expect(@client).to be_invalid
    end

    it "should reject invalid emails" do
      invalid_emails = %i[plainaddress #@%^%#$@#$@#.com @example.com <email@example.com> email.example.com email@example@example.com  あいうえお@example.com email@-example.com]
      invalid_emails.each do |email|
        @client.email = email
        expect(@client).to be_invalid
      end
    end

    it "should have an active attribute" do
      @client.active = nil
      expect(@client).to be_invalid
    end

    it "should accept booleans for active attribute" do
      @client.active = false
      expect(@client).to be_valid
    end
  end
end
