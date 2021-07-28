require 'rails_helper'

RSpec.describe WorkPeriod, type: :model do
  before :all do
    @work_period = build :work_period
  end
  context "validations" do
    it "should have a title less than 101 chars" do
      @work_period.title = "a" * 101
      expect(@work_period).to be_invalid
    end
    it "should have a title less than 101 chars" do
      @work_period.title = "a" * 100
      expect(@work_period).to be_valid
    end
    it "should have a start_time" do
      @work_period.start_time = nil
      expect(@work_period).to be_invalid
    end
    it "should have an end_time" do
      @work_period.end_time = nil
      expect(@work_period).to be_invalid
    end
  end
end
