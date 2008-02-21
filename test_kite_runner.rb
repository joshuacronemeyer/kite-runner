require 'rubygems'
require 'test/unit'
require 'kite_runner'
require 'mocha'

class TestKiteRunner < Test::Unit::TestCase
  def test_process_keypress_sends_message_to_the_kite
    game = StubKiteRunner.new
    game.expects(:close)
    game.player1.expects(:left)
    game.player1.expects(:right)
    game.player1.expects(:longer)
    game.player1.expects(:shorter)
    game.player2.expects(:left)
    game.player2.expects(:right)
    game.player2.expects(:longer)
    game.player2.expects(:shorter)
    
    game.process_keypress
  end
end

#couldn't figure out how to do this with mocha.  :(
class StubKiteRunner < KiteRunner
  def initialize
    @player1 = Object.new
    @player2 = Object.new
end

  def button_down?(foo)
    return true
  end
end
