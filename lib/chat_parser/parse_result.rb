module ChatParser
  ParseResult = Struct.new(:note, :messages) do
    def initialize(note = "", messages = [])
      super
    end
  end
end
