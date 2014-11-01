class Queens
  attr_reader :white, :black

  def initialize(args = {})
    @white = args[:white] || [0,3]
    @black = args[:black] || [7,3]
    raise ArgumentError if white == black 
  end

  def attack?
    horizontal? || vertical? || diagnal?
  end

  def to_s
    set(white, 'W')
    set(black, 'B')
    grid.map { |row| row.join(' ') }.join("\n")
  end

  private

  def grid
    @grid ||= Array.new(8) { Array.new(8) { '_' } }
  end

  def set(pos, sym)
    x,y = pos
    grid[x][y] = sym
  end

  def horizontal?
    white[0] == black[0]
  end

  def vertical?
    white[1] == black[1]
  end

  def diagnal?
    white_val = white[0] * 8 + white[1] + 1
    black_val = black[0] * 8 + black[1] + 1
    (white_val - black_val) % 9 == 0 || 
    (white_val - black_val) % 7 == 0
  end

  def grid_value(queen)

  end

  # def diagnal?
  #   x,y = white
  #   white_diagnals = diagnals(x, y,  1,  1) +  # down-right
  #                    diagnals(x, y,  1, -1) +  # down-left
  #                    diagnals(x, y, -1, -1) +  # up-left
  #                    diagnals(x, y, -1,  1)    # up- right
  #   p white_diagnals                
  #   white_diagnals.include?(black)
  # end

  # def diagnals(x, y, dx, dy)
  #   return [] unless in_bound(x,y)
  #   [[x,y]] + diagnals(x+dx,y+dy, dx, dy) 
  # end

  # def in_bound(x,y)
  #   x.between?(0,7) && y.between?(0,7)
  # end

end
    

queens = Queens.new(white: [6, 1], black: [1, 6])
puts queens.to_s
puts queens.attack?