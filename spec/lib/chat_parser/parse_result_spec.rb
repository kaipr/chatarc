require "spec_helper"
require "chat_parser/parse_result"

describe ChatParser::ParseResult do
  it "has default values" do
    result = ChatParser::ParseResult.new

    expect(result.note).to eq ""
    expect(result.messages).to eq []
  end
end
