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
    "<div class='pocket_score'>Pocket #{game.pocket_score}</div>"
  end

  def display_banked_amount(game)
    "<div class='banked_amount'>$ #{game.banked_amount}</div>"
  end

  def help_dice(face)
    "<img class='help-dice' src='images/dice_#{face}.png'/>"
  end

  def display_bank_button(game)
    btn_class =  game.can_bank? ? 'btn-success' : 'disabled'
    href =  game.can_bank? ? '/bank' : '#'

    return "<a class='btn #{btn_class}' href='#{href}'>
              <span class='icon-briefcase'></span> Bank
            </a>"
  end

end
