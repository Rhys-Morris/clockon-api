require 'rails_helper'

RSpec.describe User, type: :model do
    context "validations" do
        before :each do
           @user = build :user 
        end

        context "password" do
            it "has a password" do
                @user.password = nil
                expect(@user).to be_invalid
            end

            it "password > 8 characters" do
                @user.password = "1234567"
                expect(@user).to be_invalid
                @user.password = "12345678"
                expect(@user).to be_valid
            end
        end

        context "email" do 
            it "has an email" do
                @user.email = nil
                expect(@user).to be_invalid
            end

            it "prevents duplicate emails" do
                @user.save
                duplicate_user = build :user
                expect(duplicate_user).to be_invalid
                duplicate_user.email = "changed@test.com"
                expect(duplicate_user).to be_valid
            end
    
            it "rejects invalid email addresses" do
                invalid_emails = %i[plainaddress #@%^%#$@#$@#.com @example.com <email@example.com> email.example.com email@example@example.com  あいうえお@example.com email@-example.com]
                invalid_emails.each do |email|
                    @user.email = email
                    expect(@user).to be_invalid
                end
            end
        end

        context "name" do
            it "has a name" do
                @user.name = nil
                expect(@user).to be_invalid
            end

            it "rejects invalid characters" do
                invalid_names = %i[@yes .man who=me 77 whe`difo]
                invalid_names.each do |name|
                    @user.name = name
                    expect(@user).to be_invalid
                end
            end
        end
    end
   
end