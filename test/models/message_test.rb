require 'test_helper'

describe Message do
  let(:message_obj) { Message.new }

  it 'must be valid' do
    message_obj.must_be :valid?
  end
end
