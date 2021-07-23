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
        it "has the correct password" do
            expect(@user.password).to eq "password"
        end
    end
end

RSpec.describe "Client Factory" do
    it "is valid" do
        expect(build :client).to be_valid
    end
    context "testing factory properties" do
        before :all do 
            @client = build :client
        end
        it "has the correct email" do
            expect(@client.email).to eq "testclient@test.com"
        end
        it "has the correct name" do
            expect(@client.name).to eq "Test Client"
        end
        it "has the correct active status" do
            expect(@client.active).to eq true
        end
        it "has the correct association with user" do
            expect(@client.user.name).to eq "John"
        end
        it "has the correct contact" do
            expect(@client.contact).to eq "George Cooper"
        end
    end
end

RSpec.describe "Project Factory" do
    it "is valid" do
        expect(build :project).to be_valid
    end
    context "testing factory properties" do
        before :all do 
            @project = build :project
        end
        it "has the correct color" do
            expect(@project.color).to eq "#000000"
        end
        it "has the correct name" do
            expect(@project.name).to eq "Test Project"
        end
        it "has the correct active status" do
            expect(@project.active).to eq true
        end
        it "has the correct billable status" do
            expect(@project.billable).to eq true
        end
        it "has the correct due date" do
            expect(@project.due_date).to eq Date.new(2022, 7, 30)
        end
        it "has the correct hours" do
            expect(@project.hours).to eq 1.5
        end
        it "has the correct association with user" do
            expect(@project.user.name).to eq "John"
        end
        it "has the correct association with client" do
            expect(@project.client.name).to eq "Test Client"
        end
    end
end