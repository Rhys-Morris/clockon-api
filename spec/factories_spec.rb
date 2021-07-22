require 'rails_helper'

RSpec.describe "User Factory" do
    it "is valid" do
        expect(build :user).to be_valid
    end
    context "testing factory properties" do
        before :all do 
            @user = build :user
        end
        it "has the correct email" do
            expect(@user.email).to eq "john@test.com"
        end
        it "has the correct name" do
            expect(@user.name).to eq "John"
        end
    end
end