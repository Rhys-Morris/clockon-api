require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :all do
    @expense = build :expense
  end

  context "validations" do
    it "should have a name" do
      @expense.name = nil
      expect(@expense).to be_invalid
    end
    it "shouldn't have a name greater than 40 chars" do
      @expense.name = "a" * 40
      expect(@expense).to be_valid
      @expense.name = "a" * 41
      expect(@expense).to be_invalid
    end
    it "should have a date" do
      @expense.date = nil
      expect(@expense).to be_invalid
    end
    it "should have a cost" do
      @expense.cost = nil
      expect(@expense).to be_invalid
    end
    it "should have a cost value greater than > 0.0 and < 10000.0" do
      @expense.cost = 0.0
      expect(@expense).to be_invalid
      @expense.cost = 10000.0
      expect(@expense).to be_invalid
    end
  end
end
