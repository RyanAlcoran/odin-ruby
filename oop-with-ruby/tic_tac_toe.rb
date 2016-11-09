class Player
  attr_reader :name, :mark

  def initialize(player_name = nil, player_mark = nil)
    @name, @mark = player_name, player_mark
  end

  def set_name(name)
    @name = name
  end

  def set_mark(mark)
    @mark = mark
  end
end

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3){Array.new(3){Cell.new}}
  end

  def position(index)
    case index
      when 1; return grid[0][0]
      when 2; return grid[0][1]
      when 3; return grid[0][2]
      when 4; return grid[1][0]
      when 5; return grid[1][1]
      when 6; return grid[1][2]
      when 7; return grid[2][0]
      when 8; return grid[2][1]
      when 9; return grid[2][2]
      else; return nil
    end
  end

  def set_cell(index, player)
    position(index).make_mark(player)
  end

  def value_at(index)
    position(index).value || " "
  end

  def is_full?
    grid.all? {|row| row.all? {|cell| cell.full?}}
  end

  def three_in_a_row(mark)
    return mark if grid.any? {|row| row.all? {|value| value == mark}}
    return mark if grid.transpose.any? {|column| column.all? {|value| value == mark}}
    return mark if value_at(1) == mark && value_at(5) == mark && value_at(9) == mark
    return mark if value_at(3) == mark && value_at(5) == mark && value_at(7) == mark
    nil
  end

  def winner
    return "X" if three_in_a_row("X")
    return "O" if three_in_a_row("O")
    nil
  end

  def still_playing?
    return true if winner.nil? && !is_full?
    false
  end

  def draw
    puts "#{value_at(1)} | #{value_at(2)} | #{value_at(3)}"
    puts "--+---+--"
    puts "#{value_at(4)} | #{value_at(5)} | #{value_at(6)}"
    puts "--+---+--"
    puts "#{value_at(7)} | #{value_at(8)} | #{value_at(9)}"
  end
end

class Cell
  attr_accessor :value
  attr_accessor :owner

  def initialize(value = nil, owner = nil)
    @value, @owner = value, owner
  end

  def make_mark(player)
    @value = player.mark
    @owner = player.name
  end

  def nil?
    value == nil
  end

  def full?
    !self.nil?
  end
end

class Game
  attr_accessor :player1, :player2, :board, :current_player
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @board = Board.new
    @current_player = nil
  end

  def get_players
    print "Player 1, you will be X. You have the first move. What's your name? "
    @player1.set_name(gets.chomp)
    @player1.set_mark("X")
    print "Player 2, you will be O. What's your name? "
    @player2.set_name(gets.chomp)
    @player2.set_mark("O")
  end

  def get_move(current_player)
    print "\nPlease input a place (1-9, from upper left to lower right) to "
    print "mark your #{current_player.mark}: "
    position = gets.chomp.to_i
  end

  def play(player1, player2, current_player)
    puts "Your turn, #{current_player.name.upcase}"
    board.draw
    index = get_move(current_player)
    while board.position(index).value != nil || !((1..9) === index)
      if board.position(index).value != nil
        puts "That space is already taken"
      else
        puts "That is not a valid input"
      end
      index = get_move(current_player)
    end
    board.set_cell(index, current_player)
    current_player == player1 ? player2 : player1
  end

  def start
    puts "-------------"
    puts " TIC TAC TOE "
    puts "-------------"
    
    get_players
    current_player = player1
    current_player = play(player1, player2, current_player) while board.still_playing?
    board.draw

    if board.winner == "X"
      puts "#{player1.name.upcase} has won the game!"
    elsif board.winner == "O"
      puts "#{player2.name.upcase} has won the game!"
    elsif board.is_full?
      puts "Game over. It's a draw."
    end
  end
end

game = Game.new
game.start
