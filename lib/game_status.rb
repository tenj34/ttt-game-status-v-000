# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  WIN_COMBINATIONS.each_with_index do |element,index|
    if position_taken?(board,element[0]) == true
      if board[element[0]] == board[element[1]] && board[element[1]] == board[element[2]]
        return WIN_COMBINATIONS[index]
      end
    end
  end
  return false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  won?(board) == false && full?(board)== true
end

#  returns true if the board has been won, is a draw, or is full
def over?(board)
  while won?(board)
    if draw?(board) == true  || full?(board) == true
      return true
    end
  end
end
