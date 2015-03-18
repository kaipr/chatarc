require 'test_helper'

describe Channel do
  let(:channel) { Channel.new(name: 'somechannel') }

  it 'must be valid' do
    channel.must_be :valid?
  end
end
