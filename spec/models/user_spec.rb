require "rails_helper"

RSpec.describe User, type: :model do
  user = User.new(email: "email@test.com", password: "password")
  before { user.save }

  it "should be valid with valid attributes" do
    expect(user).to be_valid
  end

  it "email should be present" do
    user.email = nil

    expect(user).to_not be_valid
  end

  it "email should be unique" do
    user = User.create!(email: "email@test.com", password: "password")
    new_user = User.new(email: "email@test.com", password: "password")

    expect(new_user).to_not be_valid
  end

  it "password should be present" do
    user.password = nil

    expect(user).to_not be_valid
  end

  it "should have many studies" do
    t = User.reflect_on_association(:studies)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many openings" do
    t = User.reflect_on_association(:openings)
    expect(t.macro).to eq(:has_many)
  end
end
