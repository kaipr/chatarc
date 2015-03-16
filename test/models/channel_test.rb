require "test_helper"

class ChannelTest < ActiveSupport::TestCase

  def channel
    @channel ||= Channel.new(name: 'somechannel')
  end

  def test_valid
    assert channel.valid?
  end

end
