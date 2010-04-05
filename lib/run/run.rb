$: << File.join(File.dirname(__FILE__), "..")
require 'java'
require 'TTTSwing.jar'
require 'controller/controller'
require 'player/man_player'
require 'player/machine_player'
require 'ui/console'
require 'ui/io'

#ui = Java::gui.swing.Frame.new
ui = Ui::Console.new(Ui::IO.new)

controller = Controller::Controller.new(ui)

ui.set_controller(controller)
ui.new_game()
