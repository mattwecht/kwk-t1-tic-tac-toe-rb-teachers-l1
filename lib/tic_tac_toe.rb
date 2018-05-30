# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

