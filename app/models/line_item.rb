class LineItem < ActiveRecord::Base

  belongs_to :game
  belongs_to :order

  def self.new_based_on( game )
    line_item = self.new
    line_item.game = game
    line_item.quantity = 1
    line_item.price = game.price
    return line_item
  end
end
