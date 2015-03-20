module ChatParser
  class Parser
    attr_reader :messages, :note

    def initialize(format)
      @format = format
      @participants = {}
      @channels = {}

      @messages = []
      @note = ''
    end

    def parse(chat)
      format_names = @format.names.map(&:to_sym)

      chat.scan(@format).each do |line|
        # OPTIMIZE there might be a better way to make scan use named captures
        line = Hash[format_names.zip(line)]

        if line[:name].present? && line[:message].present?
          @messages << build_message(line)
        else
          @note += "#{line[:note]}\n"
        end
      end

      self
    end

    def build_message(args)
      Message.new({
        channel:     get_channel(args[:channel]),
        participant: get_participant(args[:name]),
        content:     args[:message],
        sent_at:     args[:time]
      })
    end

    def get_channel(name)
      return unless name.present?
      @channels[name] ||= Channel.find_or_initialize_by(name: name)
    end

    def get_participant(name)
      return unless name.present?
      @participants[name] ||= Participant.find_or_initialize_by(name: name)
    end
  end
end
