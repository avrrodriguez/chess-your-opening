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
    new_user = User.new(email: "email@test.com", password: "password")
    new_user.save

    expect(new_user).to_not be_valid
  end

  it "password should be present" do
    user.password = nil

    expect(user).to_not be_valid
  end
end
