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
        it "has the correct billble rate" do
            expect(@project.billable_rate).to eq 40.0
        end
        it "has the correct association with user" do
            expect(@project.user.name).to eq "John"
        end
        it "has the correct association with client" do
            expect(@project.client.name).to eq "Test Client"
        end
    end
end

RSpec.describe "Task Factory" do
    it "is valid" do
        expect(build :task).to be_valid
    end
    context "testing factory properties" do
        before :all do 
            @task = build :task
        end
        it "has the correct title" do
            expect(@task.title).to eq "New Task"
        end
        it "has the correct due date" do
            expect(@task.due_date).to eq Date.new(2021, 12, 25)
        end
        it "has the correct estimated hours" do
            expect(@task.estimated_hours).to eq 10.0
        end
        it "has the correct association with project" do
            expect(@task.project.name).to eq "Test Project"
        end
    end
end

RSpec.describe "Expense Factory" do
    it "is valid" do
        expect(build :expense).to be_valid
    end
    context "testing factory properties" do
        before :all do 
            @expense = build :expense
        end
        it "has the correct title" do
            expect(@expense.name).to eq "New Expense"
        end
        it "has the correct date" do
            expect(@expense.date).to eq Date.new(2021, 07, 26)
        end
        it "has the correct cost" do
            expect(@expense.cost).to eq 20.5
        end
        it "has the correct association with project" do
            expect(@expense.project.name).to eq "Test Project"
        end
    end
end

RSpec.describe "WorkPeriod Factory" do
    it "is valid" do
        expect(build :work_period).to be_valid
    end
    context "testing factory properties" do
        before :all do 
            @work_period = build :work_period
        end
        it "has the correct title" do
            expect(@work_period.title).to eq "A task I was working on"
        end
        it "has the correct start_time" do
            expect(@work_period.start_time).to eq "2021-07-28 12:50:49"
        end
        it "has the correct end_time" do
            expect(@work_period.end_time).to eq "2021-07-28 12:50:56"
        end
        it "has the correct invoiced property" do
            expect(@work_period.invoiced).to eq false
        end
        it "has the correct association with project" do
            expect(@work_period.project.name).to eq "Test Project"
        end
    end
end