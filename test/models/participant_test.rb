require "test_helper"

class ParticipantTest < ActiveSupport::TestCase

  def participant
    @participant ||= Participant.new(name: 'Chris')
  end

  def test_valid
    assert participant.valid?
  end

end
