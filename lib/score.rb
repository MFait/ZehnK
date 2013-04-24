class Score

  def initialize
    @dices = []
  end

  def calculate(dice_set)
    @dices = dice_set.dices
    sum = 0

    sum += 100 if single?(1)
    sum += 200 if double?(1)
    sum += 1000 if triple?(1)

    sum += 50 if single?(5)
    sum += 100 if double?(5)

    [2, 3,4,5,6].each { |v| sum += v * 100 if triple?(v) }

    sum
  end

  def number_of(face)
    @dices.select { |dice| dice.face==face}.length
  end

  def single?(face)
    number_of(face) == 1
  end


  def double?(face)
    number_of(face) == 2
  end

  def triple?(face)
    number_of(face) == 3
  end
end