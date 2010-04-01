module Command
  class NewGameCommand
    def initialize(game)
      @game = game
    end

    def execute(args)
      @game.reset
    end
  end
end
