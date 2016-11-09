class Board
  MAX_MOVES = 12
  attr_accessor :guess_stack, :feedback_stack, :current_row

  def initialize
    @guess_stack = []
    @feedback_stack = []
    @current_row = -1
    @code = Array.new(4) {rand(1..6)}
  end

  def moves_left
    MAX_MOVES - 1 - @current_row
  end

  def set_guess(guess)
    if @current_row < MAX_MOVES
      @guess_stack << guess
      @current_row += 1
    end
  end

  def get_guess
    @guess_stack[@current_row]
  end

  def set_feedback(feedback)
    if @current_row >= 0
      @feedback_stack[@current_row] = feedback
    end
  end

  def get_feedback
    @feedback_stack[@current_row]
  end

  def draw_board()
  end
end

class CodeMaker
  attr_reader :code
  
  def intialize
    @code = Array.new(4) {rand(1..6)}
  end

  def check_guess(guess)
    feedback = []
    matches = []
    non_match_code = []
    #first check for exact matches and add black to feedback array
    #mark it as matched
    guess.each_index { |i|
      if guess[i] == @code[i]
        feedback << "B"
        matches[i] = true
      else
        matches[i] = false
        non_match_code << @code[i]
      end
    }

    #check if any non matches have the same color as remaining in the code and white to feedback array
    guess.each_index { |i|
      if matches[i] == false
        if non_match_code.include?(guess[i])
          feedback << "W"
          #add code to delete match from non_match_code
        end
      end
    }
    feedback
  end
end

class Game
end