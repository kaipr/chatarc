require "rails_helper"
require "chat_parser/parser"
require "chat_parser/formats"

describe ChatParser::Parser do
  subject(:parser) { ChatParser::Parser.new(ChatParser::Formats::GENERIC) }

  describe ".new" do
    it "has default values" do
      expect(parser.messages).to eq []
      expect(parser.note).to eq ""
    end
  end

  describe "#parse" do
    let(:chat) do
      <<-END.gsub(/^\s+\|/, "")
      |Chat between Max and Julie
      |[10:23] [General] [Max]: Hello Julie
      |[10:23] [General] [Julie]: Hey max!
      END
    end

    it "parses the chat into messages and a note" do
      parser.parse chat

      expect(parser.messages.size).to eq 2
      expect(parser.note).to eq "Chat between Max and Julie\n"
    end

    it "does nothing if given nothing" do
      parser.parse nil

      expect(parser.messages.size).to eq 0
      expect(parser.note).to eq ""
    end
  end

  describe "#build_message" do
    it "builds a message with given arguments" do
      args = {
        time: "10:23",
        channel: "General",
        name: "Max",
        message: "Foo is so bar",
      }

      message = parser.build_message(args)

      expect(message.sent_at.strftime("%H:%M")).to eq "10:23"
      expect(message.channel.name).to eq "General"
      expect(message.participant.name).to eq "Max"
      expect(message.content).to eq "Foo is so bar"
    end
  end

  describe "#get_channel" do
    context "with not existing channel" do
      it "returns a new channel with given name" do
        channel_name = build(:channel).name

        channel = parser.get_channel(channel_name)

        expect(channel).to be_a_new(Channel)
        expect(channel.name).to eq channel_name
      end
    end

    context "with existing channel" do
      it "returns the existing channel" do
        channel = create(:channel)

        returned = parser.get_channel(channel.name)

        expect(returned).not_to be_new_record
        expect(returned.name).to eq channel.name
      end
    end

    it "returns the same object when requested multiple times" do
      channel_name = build(:channel).name

      channel = parser.get_channel(channel_name)

      expect(parser.get_channel(channel_name)).to be(channel)
    end

    it "returns nil when no name is given" do
      returned = parser.get_channel(nil)

      expect(returned).to be_nil
    end
  end

  describe "#get_participant" do
    context "with not existing channel" do
      it "returns a new participant with given name" do
        participant_name = build(:participant).name

        participant = parser.get_participant(participant_name)

        expect(participant).to be_a_new(Participant)
        expect(participant.name).to eq participant_name
      end
    end

    context "with existing participant" do
      it "returns the existing participant" do
        participant = create(:participant)

        returned = parser.get_participant(participant.name)

        expect(returned).not_to be_new_record
        expect(returned.name).to eq participant.name
      end
    end

    it "returns the same object when requested multiple times" do
      participant_name = build(:participant).name

      participant = parser.get_participant(participant_name)

      expect(parser.get_participant(participant_name)).to be participant
    end

    it "returns nil when no name is given" do
      expect(parser.get_channel(nil)).to be_nil
    end
  end
end
