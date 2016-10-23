require "rails_helper"

describe Conversation, type: :model do
  it "is valid" do
    expect(build(:conversation)).to be_valid
  end

  describe "#content=" do
    it "parses out messages and note" do
      content = "Some content\n[foo]: this is so bar\n[joe]: yup"
      conversation = build(:conversation, note: nil, content: content)

      conversation.save

      expect(conversation.note).to eq "Some content\n"
      expect(conversation.messages.count).to eq 2
      expect(conversation.messages.first.content).to eq "this is so bar"
    end

    it "adds parsed note to existing" do
      conversation = build(:conversation,
                           note: "Special chat\n",
                           content: "This is special")

      conversation.save

      expect(conversation.note).to eq "Special chat\nThis is special\n"
    end

    it "does not change the conversation without content" do
      conversation = build(:conversation, note: nil, content: nil)
      dup = conversation.dup

      conversation.save

      expect(conversation.note).to eq dup.note
      expect(conversation.messages).to eq dup.messages
    end

    it "resets content after parsing" do
      conversation = build(:conversation, content: "Some content")

      conversation.save

      expect(conversation.content).to be_nil
    end
  end
end
