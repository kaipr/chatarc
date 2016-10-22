class Conversation < ApplicationRecord
  has_many :messages

  scope :with_messages, -> { includes(messages: [:channel, :participant]) }
end
