require "rails_helper"

describe Participant, type: :model do
  it "is valid" do
    expect(build(:participant)).to be_valid
  end
end
