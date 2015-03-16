require "test_helper"

class MessageTest < ActiveSupport::TestCase

  def message
    @message ||= Message.new
  end

  def test_valid
    assert message.valid?
  end

end
