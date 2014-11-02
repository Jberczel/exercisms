class Matrix
  attr_reader :text, :grid

  def initialize(text)
    @text = text
    @grid ||= setup_grid
  end

  def rows
    grid
  end

  def columns
    grid.transpose
  end

  #returns [[x,y]]
  def saddle_points
    saddle_points = []
    each do |r,c|
      saddle_points << [r,c] if grid[r][c] == rows[r].max && grid[r][c] == columns[c].min
    end
    saddle_points
  end

  private

  def setup_grid
    text.each_line.map do |line| 
      line.split.map(&:to_i)
    end
  end

  def each(&block)
    grid.each_index do |r|
      grid[r].each_index { |c| block.call(r,c) }
    end
  end

end


matrix = Matrix.new("89 1903 3\n18 3 1\n9 4 800")

matrix.saddle_points