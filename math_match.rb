require './Player'

class MathMatch

  attr_accessor :players

  PLAYER_LIVES = 3
  QUESTION_MAX_NUM = 20

  MSG_NEW_TURN = '---- NEW TURN ----'
  MSG_GAME_OVER = "---- GAME OVER ----\nGood bye!"
  MSG_QUESTION = "Plyer %s: What does %s plus %s equal?"
  MSG_WRONG_ANSWER = "Plyer %s: Seriously? No!"
  MSG_CORRECT_ANSWER = "Plyer %s: YES! YOU are correct."

  def initialize(p1_name = '1', p2_name = '2')    
    p1 = Player.new(p1_name)
    p2 = Player.new(p2_name)

    p1.lives = PLAYER_LIVES
    p2.lives = PLAYER_LIVES

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
      puts MSG_NEW_TURN
      host_player = @players[host_player_index]

      # Make a question and return answer
      expected_answer = make_question(host_player.name)
      # Get user's answer and return answer is correr or not
      if !correct_user_answer?(expected_answer) 
        # Answered user [1- host_player_index]
        @players[1 - host_player_index].removeLive
        puts format(MSG_WRONG_ANSWER, host_player.name)
      else
        puts format(MSG_CORRECT_ANSWER, host_player.name)        
      end

      # Toggle host_player
      host_player_index = 1 - host_player_index
    end

    puts MSG_GAME_OVER
  end

  def make_question (name)
    num1 = Random.rand(1..QUESTION_MAX_NUM)
    num2 = Random.rand(1..QUESTION_MAX_NUM)
    puts format(MSG_QUESTION, name, num1, num2)
    num1 + num2
  end

  def print_message
  end

  private

  def correct_user_answer? (expected_answer)
    gets.chomp.to_i == expected_answer
  end


  # def should return messages
    # ex ---Game Over--- Good bye || score || correct/wrong answer
  # end

end