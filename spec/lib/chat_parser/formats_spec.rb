require "rails_helper"
require "chat_parser/formats"

describe ChatParser::Formats do
  describe "GENERIC" do
    it "matches a chat line with name and message" do
      line = "[Max]: This is a message"

      match = line.match ChatParser::Formats::GENERIC

      expect(match[:name]).to eq    "Max"
      expect(match[:message]).to eq "This is a message"
    end

    it "matches an outgoing chat line with name and message" do
      line = "To [Julie]: This is a message"

      match = line.match ChatParser::Formats::GENERIC
      expect(match[:name]).to eq    "Julie"
      expect(match[:message]).to eq "This is a message"
      expect(match[:whisper]).to eq "To "
    end

    it "matches a chat line with time, name and message" do
      line = "[10:23] [Max]: This is a message"

      match = line.match ChatParser::Formats::GENERIC
      expect(match[:time]).to eq    "10:23"
      expect(match[:name]).to eq    "Max"
      expect(match[:message]).to eq "This is a message"
    end

    it "matches a chat line with channel, name and message" do
      line = "[General] [Max]: This is a message"

      match = line.match ChatParser::Formats::GENERIC
      expect(match[:channel]).to eq "General"
      expect(match[:name]).to eq    "Max"
      expect(match[:message]).to eq "This is a message"
    end

    it "matches a chat line with time, channel, name and message" do
      line = "[10:23] [General] [Max]: This is a message"

      match = line.match ChatParser::Formats::GENERIC
      expect(match[:time]).to eq    "10:23"
      expect(match[:channel]).to eq "General"
      expect(match[:name]).to eq    "Max"
      expect(match[:message]).to eq "This is a message"
    end

    it "matches a chat line without anything as note" do
      line = "Chat with Foo on 2015-01-12"

      match = line.match ChatParser::Formats::GENERIC
      expect(match[:note]).to eq "Chat with Foo on 2015-01-12"
    end
  end
end
