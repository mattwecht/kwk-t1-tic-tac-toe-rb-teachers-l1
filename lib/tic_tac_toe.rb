# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  i = 1
  until i == 10
    turn(board)
    i +=1
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # diagonals
  [2,4,6],
  [0,3,6], # vertical
  [2,5,8],
  [1,4,7]
]
def won? (board)
  WIN_COMBINATIONS.each do |combo|
    positions = [board[combo[0]],board[combo[1]],board[combo[2]]] #create an array of values in the positions required for a win
    if !(positions[0]==""||positions[0]==" ")
      if(positions[0]==positions[1]&& positions[1]==positions[2]) #if they match
        return combo
      end
    end
  end
  return false #no match found
end

def full? (board)
  board.all? do |spot|
    spot =="X" || spot == "O"
  end
end

def draw? (board)
  if full?(board)
    if (won?(board) == false)
      return true
    end
  end
  return false
end

def over?(board)
  if (draw?(board) || won?(board))
    return true
  end
  return false
end

def winner (board)
  index = won?(board)
  if(index != false)
    return board[index[0]]
  end
end

def turn_count (board)
  board.count do |spot|
    spot == "X" || spot == "O"
  end
end

def current_player(board)
  if turn_count(board) %2 == 0
    return "X"
  end
  return "O"
end


def play (board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
