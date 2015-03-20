require 'test_helper'
require 'chat_parser/formats'

describe ChatParser::Formats do
  describe 'GENERIC' do
    it 'must match a chat line with name and message' do
      line = '[Max]: This is a message'

      match = line.match ChatParser::Formats::GENERIC
      match[:name].must_equal    'Max'
      match[:message].must_equal 'This is a message'
    end

    it 'must match an outgoing chat line with name and message' do
      line = 'To [Julie]: This is a message'

      match = line.match ChatParser::Formats::GENERIC
      match[:name].must_equal    'Julie'
      match[:message].must_equal 'This is a message'
      match[:whisper].must_equal 'To '
    end

    it 'must match a chat line with time, name and message' do
      line = '[10:23] [Max]: This is a message'

      match = line.match ChatParser::Formats::GENERIC
      match[:time].must_equal    '10:23'
      match[:name].must_equal    'Max'
      match[:message].must_equal 'This is a message'
    end

    it 'must match a chat line with channel, name and message' do
      line = '[General] [Max]: This is a message'

      match = line.match ChatParser::Formats::GENERIC
      match[:channel].must_equal 'General'
      match[:name].must_equal    'Max'
      match[:message].must_equal 'This is a message'
    end

    it 'must match a chat line with time, channel, name and message' do
      line = '[10:23] [General] [Max]: This is a message'

      match = line.match ChatParser::Formats::GENERIC
      match[:time].must_equal    '10:23'
      match[:channel].must_equal 'General'
      match[:name].must_equal    'Max'
      match[:message].must_equal 'This is a message'
    end

    it 'must match a chat line without anything as note' do
      line = 'Chat with Foo on 2015-01-12'

      match = line.match ChatParser::Formats::GENERIC
      match[:note].must_equal 'Chat with Foo on 2015-01-12'
    end
  end
end
