class Board
  def self.transform(board)
    new(board).transform.to_s
  end

  attr_reader :board

  def initialize(board)
    @board = board
    validate_board
  end

  def transform
    board.each_with_index do |row, r|
      row.chars.each_with_index do |col, c|
        if col == " "
          counter = 0
          counter += 1 if board[r][c-1] == '*'
          counter += 1 if board[r][c+1] == '*'
          counter += 1 if board[r+1][c] == '*'
          counter += 1 if board[r-1][c] == '*'

          # diagnals
          counter += 1 if board[r+1][c+1] == '*'
          counter += 1 if board[r+1][c-1] == '*'
          counter += 1 if board[r-1][c-1] == '*'
          counter += 1 if board[r-1][c+1] == '*'
          board[r][c] = counter.zero? ? ' ' : counter.to_s
        end
      end
    end
    self
  end

  def to_s
    board
  end

  def validate_board
    if !valid_rows? || !same_column_sizes?
       raise ValueError
    end
  end

  def valid_rows?
    valid_mid_rows? && valid_top_bottom_rows?
  end

  def valid_mid_rows?
    board[1..-2].all? { |row| row[/\|[\s\*]+\|/] }
  end

  def valid_top_bottom_rows?
    top, bottom = board.first, board.last
    [top, bottom].all? { |row| row[/\+-+\+/] }
  end

  def same_column_sizes?
    size = board.first.size
    board.all? { |col| col.size == size }
  end
end

class ValueError < ArgumentError; end







 