class Dice

  def initialize
    @face = 1
  end

  def face
    @face
  end

  def face=(face)
    raise(ArgumentError, 'Invalid Face') unless face.between?(1,6) and face.is_a? Integer
    @face = face
  end

  def roll
    @face = range_rand(1, 6)
    return self
  end

  private

  def range_rand(min,max)
    min + Kernel.rand(max-min)
  end

end