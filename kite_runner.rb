require 'rubygems'
require 'gosu'
require 'enumerator'
require 'kite'

class KiteRunner < Gosu::Window
  attr_accessor :player1, :player2
  def initialize
    super(640, 480, false)
    self.caption = "Kite Runner Game"
    @player1 = Kite.new(self, 300, 470) 
    @player2 = Kite.new(self, 350, 470)
    @background_image = Gosu::Image.new(self, "Sky.png", true)
  end

  def update
    process_keypress
    @player1.move 
    @player2.move
  end

  def draw
    @background_image.draw(0, 0, 0)
    @player1.draw
    @player2.draw
  end

  def process_keypress()
    close if button_down?(Gosu::Button::KbEscape)
    @player1.send('left') if button_down?(Gosu::Button::KbLeft)
    @player1.send('right') if button_down?(Gosu::Button::KbRight)
    @player1.send('longer') if button_down?(Gosu::Button::KbUp)
    @player1.send('shorter') if button_down?(Gosu::Button::KbDown)
    @player2.send('left') if button_down?(Gosu::Button::Kb1)
    @player2.send('right') if button_down?(Gosu::Button::Kb4)
    @player2.send('longer') if button_down?(Gosu::Button::Kb2)
    @player2.send('shorter') if button_down?(Gosu::Button::Kb3)
  end

end
