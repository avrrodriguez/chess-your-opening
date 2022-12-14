require "rails_helper"

RSpec.describe Opening, type: :model do
  opening = Opening.new(name: "test name", description: "test description", difficulty: "test difficulty", variation: "test variation")

  before { opening.save }

  it "should be valid with valid attribute" do
    expect(opening).to be_valid
  end

  it "name should be present" do
    opening.name = nil

    expect(opening).to_not be_valid
  end

  it "description should be present" do
    opening.description = nil

    expect(opening).to_not be_valid
  end

  it "difficulty should be present" do
    opening.difficulty = nil

    expect(opening).to_not be_valid
  end

  it "variation should be present" do
    opening.variation = nil

    expect(opening).to_not be_valid
  end
end
