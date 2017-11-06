class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient]
      return @stock[ingredient]

    else
      return 0
    end
  end

  def restock(ingredient, amount)
    if @stock[ingredient]
      @stock[ingredient] += amount

    else
    @stock[ingredient] = amount
   end
  end

  def add_to_shopping_list(recipe)
  end
end
