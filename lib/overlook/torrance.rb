class Torrance
  attr_accessor :count

  def initialize
    @count = 20
  end

  def to_s
    'All work and no play makes Jack a dull boy. ' * @count
  end
end