require 'test_helper'
require 'chat_parser/parser'
require 'chat_parser/formats'

describe ChatParser::Parser do
  subject { ChatParser::Parser.new(ChatParser::Formats::GENERIC) }

  describe '#parse' do
    let(:chat) do
      <<-END.gsub(/^\s+\|/, '')
      |Chat between Max and Julie
      |[10:23] [General] [Max]: Hello Julie
      |[10:23] [General] [Julie]: Hey max!
      END
    end

    it 'must parse the chat into messages and note' do
      subject.parse chat
      subject.messages.size.must_equal 2
      subject.note.must_equal "Chat between Max and Julie\n"
    end

    it 'must return self to allow chaining' do
      subject.parse('').must_be_same_as subject
    end
  end

  describe '#build_message' do
    it 'must build a message with given arguments' do
      args = { time: '10:23', channel: 'General', name: 'Max', message: 'Foo is so bar' }
      message = subject.build_message(args)

      message.sent_at.strftime('%H:%M').must_equal '10:23'
      message.channel.name.must_equal 'General'
      message.participant.name.must_equal 'Max'
      message.content.must_equal 'Foo is so bar'
    end
  end

  describe '#get_channel' do
    it 'must initialize and return a new channel with given name when it doesnt exist' do
      channel = subject.get_channel('doesnotexist')
      channel.must_be :new_record?
      channel.name.must_equal 'doesnotexist'
    end

    it 'must return the same initialized object when requested multiple times' do
      subject.get_channel('newchannel').must_be_same_as subject.get_channel('newchannel')
    end

    it 'must return the channel record when it exists' do
      channel = subject.get_channel(Channel.last.name)

      channel.wont_be :new_record?
      channel.name.must_equal Channel.last.name
    end

    it 'must return nil when no name is given' do
      subject.get_channel(nil).must_be_nil
    end
  end

  describe '#get_participant' do
    it 'must initialize and return a new participant with given name when it doesnt exist' do
      participant = subject.get_participant('doesnotexist')
      participant.must_be :new_record?
      participant.name.must_equal 'doesnotexist'
    end

    it 'must return the same initialized object when requested multiple times' do
      subject.get_participant('newmax').must_be_same_as subject.get_participant('newmax')
    end

    it 'must return the participant record when it exists' do
      participant = subject.get_participant(Participant.last.name)

      participant.wont_be :new_record?
      participant.name.must_equal Participant.last.name
    end

    it 'must return nil when no name is given' do
      subject.get_channel(nil).must_be_nil
    end
  end
end
