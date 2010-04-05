module Ui
  class IO
    attr_accessor :gets_strings
    attr_accessor :puts_strings

    def initialize
      @gets_strings = []
      @puts_strings = []
    end

    def test_gets
      if (@gets_strings.empty?)
        return gets
      end
      return @gets_strings.shift
    end

    def puts(string)
      @puts_strings << string
    end
  end
end