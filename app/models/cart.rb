class Cart

  attr_reader :items
  attr_reader :total_price

  def initialize
    empty_all_items
  end

  def add_game(game)
    existing_item = @items.find {|item| item.game_id == game.id}
    if existing_item
      existing_item.quantity += 1
    else
      @items << LineItem.new_based_on(game)
    end
    @total_price += game.price
  end

  def remove_game(game)
    existing_item = @items.find {|item| item.game_id == game.id}
    if existing_item && existing_item.quantity >1
      existing_item.quantity -= 1
    else
      @items.delete(existing_item)
    end
    @total_price -= game.price
  end

  def empty_all_items
    @items = []
    @total_price = 0.0
  end

end
