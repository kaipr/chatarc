class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :channel
  belongs_to :participant
end
