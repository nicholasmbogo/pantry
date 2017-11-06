class Pantry

  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
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
    recipe.ingredients.each do |ingredient, quantity|
      if @shopping_list[ingredient]
        @shopping_list[ingredient] += quantity
      else
        @shopping_list[ingredient] = quantity
      end
    end
  end
end
