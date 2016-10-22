module ChatParser
  class Parser
    attr_reader :messages, :note

    def initialize(format)
      @format = format
      @participants = {}
      @channels = {}

      @messages = []
      @note = ""
    end

    def parse(chat)
      chat.scan(@format).each { |line| process_line(line) }

      self
    end

    def build_message(args)
      Message.new(
        channel:     get_channel(args[:channel]),
        participant: get_participant(args[:name]),
        content:     args[:message],
        sent_at:     args[:time],
      )
    end

    def get_channel(name)
      return if name.blank?

      @channels[name] ||= Channel.find_or_initialize_by(name: name)
    end

    def get_participant(name)
      return if name.blank?

      @participants[name] ||= Participant.find_or_initialize_by(name: name)
    end

    private

    def process_line(line)
      # OPTIMIZE there might be a better way to make scan use named captures
      line = Hash[format_names.zip(line)]

      if line[:name].present? && line[:message].present?
        @messages << build_message(line)
      else
        @note += "#{line[:note]}\n"
      end
    end

    def format_names
      @_format_name ||= @format.names.map(&:to_sym)
    end
  end
end
