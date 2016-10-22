require "rails_helper"

describe Message, type: :model do
  it "is valid" do
    expect(build(:message)).to be_valid
  end
end
