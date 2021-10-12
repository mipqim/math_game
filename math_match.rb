require './Player'

class MathMatch

  attr_accessor :players

  QUESTION_MAX_NUM = 20

  def initialize(p1_name = 'P1', p2_name = 'P2')    
    p1 = Player.new(p1_name)
    p2 = Player.new(p2_name)

    @players = [p1, p2]
    @players.shuffle
  end

  def game_over?
    @players[0].lives == 0 || @players[1].lives == 0
  end

  def play
    # Host player - Making questions
    host_player_index = 0
    
    until (game_over?) do
      puts '---- NEW TURN ----'
      @players[host_player_index].removeLive
    end
  end


  # def should return messages
    # ex ---Game Over--- Good bye || score || correct/wrong answer
  # end

end