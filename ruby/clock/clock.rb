class Clock
  attr_reader :time

  HOUR = 60
  DAY  = 24

  def self.at(hr,min = 0)
    new(hr,min)
  end

  def initialize(hr,min)
    @time  = (hr * 60) + min
  end

  def to_s
    sprintf("%02d:%02d", hr, min)
  end

  def +(min)
    @time += min
    self
  end

  def -(min)
    @time -= min
    self
  end

  def ==(other)
    time == other.time
  end

  private

  def hr
    @hr = (time / HOUR) % DAY
  end

  def min
    @min = time % HOUR
  end
end

