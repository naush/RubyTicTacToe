module Command
  class NewGameCommand
    def initialize(game, ui)
      @game = game
      @ui = ui
    end

    def execute(args)
      @game.reset
    end
  end
end
