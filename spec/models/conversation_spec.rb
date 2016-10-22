require "rails_helper"

describe Conversation, type: :model do
  it "is valid" do
    expect(build(:conversation)).to be_valid
  end
end
