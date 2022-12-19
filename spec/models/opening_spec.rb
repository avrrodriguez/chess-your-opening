require "rails_helper"

RSpec.describe Opening, type: :model do
  opening = FactoryBot.build(:opening)

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

  it "should have many studies" do
    t = Opening.reflect_on_association(:studies)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many common positions" do
    t = Opening.reflect_on_association(:common_positions)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many resources" do
    t = Opening.reflect_on_association(:resources)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many posts" do
    t = Opening.reflect_on_association(:posts)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many users" do
    t = Opening.reflect_on_association(:users)
    expect(t.macro).to eq(:has_many)
  end
end
