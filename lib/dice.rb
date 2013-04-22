class Dice
  def initialize
    @face = 1
  end

  def face
    @face
  end

  def face=(face)
    raise(ArgumentError, 'Invalid Face') if face > 6

    @face = face
  end

end