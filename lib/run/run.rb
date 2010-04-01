$: << File.join(File.dirname(__FILE__), "..")
require 'controller/controller'
require 'player/man_player'
require 'player/machine_player'
require 'java'
require 'my_jar.jar'

ui = Java::com.package.SwingUI.new()
ui.

ui = ''
controller = Controller::Controller.new(ui)
controller.start_game(:man_player, :machine_player)
controller.run_game

