require './lib/dice'
require './lib/dice_set'


helpers do
  def display_table_dice_set(dice_set)
    output = []
    dice_set.dices.each_with_index do |dice, index|
      output << display_dice_with_checkbox(dice, index)
    end
    output.join ''
  end

  def display_pocket_dice_set(dice_set)
    output = []
    dice_set.dices.each do |dice|
      output << display_dice(dice)
    end
    output.join ''
  end

  def display_dice(dice)
    "<div class='dice_image'>
    <img src='images/dice_#{dice.face}.png'/>
    </div>"
  end

  def display_dice_with_checkbox(dice, index)
    "<div class='dice_image'>
    <input type='checkbox' id='img_#{index}' name='dices[#{index}]'/>
    <label for='img_#{index}'><img src='images/dice_#{dice.face}.png'/></label>
    </div>"
  end

  def display_pocket_score(game)
    "<div class='pocket_score'>Score #{game.pocket_score}</div>"
  end
end
