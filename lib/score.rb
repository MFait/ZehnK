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

  def can_calculate?(dice_set)
    occurrences_by_face(dice_set).each { |face, occurrence|
      return false if triple_only_face?(face) and not occurs_three_or_six_times?(occurrence)
    }
    true
  end

  private

  def occurs_three_or_six_times?(occurrences)
    occurrences % 3 == 0
  end

  def triple_only_face?(face)
    [2,3,4,6].include?(face)
  end

  def occurrences_by_face(dice_set)
    map = {}
    dice_set.dices.each { |dice|
      map[dice.face].nil? ? map[dice.face] = 1 : map[dice.face] += 1
    }
    map
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