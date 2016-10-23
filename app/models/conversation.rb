class Conversation < ApplicationRecord
  has_many :messages

  attr_accessor :content

  before_save :process_content, if: :has_content?

  def self.with_messages
    includes(messages: [:channel, :participant])
  end

  def has_content?
    content.present?
  end

  private

  def process_content
    result = chat_parser.parse(content)

    self.note = note.to_s + result.note
    messages << result.messages
    self.content = nil
  end

  def chat_parser
    @_chat_parser ||= ChatParser::Parser.new(ChatParser::Formats::GENERIC)
  end
end
