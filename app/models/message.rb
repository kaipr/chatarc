class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :channel
  belongs_to :participant
end
