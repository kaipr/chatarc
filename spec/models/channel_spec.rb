require "rails_helper"

describe Channel, type: :model do
  it "is valid" do
    expect(build(:channel)).to be_valid
  end
end
