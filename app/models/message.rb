class Message < ApplicationRecord
  belongs_to :conversation, touch: true
  belongs_to :channel, touch: true
  belongs_to :participant, touch: true

  validates :participant, presence: true
end
