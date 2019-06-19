module Codebreaker
  class Game
    def initialize(output = Output.new)
      @output = output
    end
    def start
      @output.puts 'Welcome to Codebreaker!'
    end
  end
end
