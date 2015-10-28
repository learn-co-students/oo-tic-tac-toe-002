class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  attr_reader :board

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(location, current_player = "X")
    board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    !(board[location].nil? || board[location] == " ")
  end

  def positions_taken?(*positions)
    positions.all? do |position|
      position_taken?(position)
    end
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    board.select do |cell|
      cell == "X" || cell == "O"
    end.length
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def same_chars?(p1, p2, p3)
    board[p1] == board[p2] && board[p1] == board[p3]
  end

  def won?
    WIN_COMBINATIONS.find do |c|
      c1, c2, c3 = c[0], c[1], c[2]
      positions_taken?(c1, c2, c3) && same_chars?(c1, c2, c3)
    end
  end

  def full?
    positions_taken?(0, 1, 2, 3, 4, 5, 6, 7, 8)
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combination = won?
      board[winning_combination.first]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
