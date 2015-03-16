require "test_helper"

class ConversationTest < ActiveSupport::TestCase

  def conversation
    @conversation ||= Conversation.new
  end

  def test_valid
    assert conversation.valid?
  end

end
