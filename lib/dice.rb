class Dice

  MIN = 1
  MAX = 6

  private_constant :MIN, :MAX

  def initialize
    @face = 1
  end

  def face
    @face
  end

  def face=(face)
    raise(ArgumentError, 'Invalid Face') unless valid_face?(face)
    @face = face
  end


  def roll
    @face = range_rand(MIN, MAX)
    self
  end

  private

  def valid_face?(face)
    face.between?(MIN, MAX) and face.is_a? Integer
  end

  def range_rand(min,max)
    min + Kernel.rand(max-min)
  end

end