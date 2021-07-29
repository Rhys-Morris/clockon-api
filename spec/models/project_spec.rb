require 'rails_helper'

RSpec.describe Project, type: :model do
  before :each do
    @project = build :project
  end

  context "validations" do
    it "should have a name" do
      @project.name = "    "
      expect(@project).to be_invalid
      @project.name = nil
      expect(@project).to be_invalid
    end  

    it "should not have a name > 40 chars" do
      @project.name = "a" * 41
      expect(@project).to be_invalid
    end

    it "should have a boolean active attribute" do
      @project.active = nil
      expect(@project).to be_invalid
    end

    it "should have a billable rate between 0 and 9999" do
      @project.billable_rate = 0
      expect(@project).to be_invalid
      @project.billable_rate = 10000
      expect(@project).to be_invalid
      @project.billable_rate = 1
      expect(@project).to be_valid
      @project.billable_rate = 9999
      expect(@project).to be_valid
    end

    it "should accept booleans for active attribute" do
      @project.active = false
      expect(@project).to be_valid
    end

    it "should have a boolean billable attribute" do
      @project.billable = nil
      expect(@project).to be_invalid
    end

    it "should accept booleans for billable attribute" do
      @project.billable = false
      expect(@project).to be_valid
    end

    it "should have a due_date property that is an instance of the Date class" do
      expect(@project.due_date).to be_instance_of Date
      @project.due_date = nil
      expect(@project).to be_invalid
    end
  end

end
