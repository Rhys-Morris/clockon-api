require 'rails_helper'

RSpec.describe Task, type: :model do
  before :each do
    @task = build :task
  end

  context "validations" do
    it "should have a title" do
      @task.title = nil
      expect(@task).to be_invalid
    end
    it "shouldn't have a tile greater than 100 chars" do
      @task.title = "a" * 100
      expect(@task).to be_valid
      @task.title = "a" * 101
      expect(@task).to be_invalid
    end
    it "should have a due_date" do
      @task.due_date = nil
      expect(@task).to be_invalid
    end
    it "should have estimated hours" do
      @task.estimated_hours = nil
      expect(@task).to be_invalid
    end
    it "should have an estimated hours value greater than > 0.0 and < 1000.0" do
      @task.estimated_hours = 0.0
      expect(@task).to be_invalid
      @task.estimated_hours = 1000.0
      expect(@task).to be_invalid
    end
  end
end
