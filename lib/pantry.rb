class Pantry

  attr_reader :stock, :shopping_list, :cook_book

  def initialize
    @stock = {}
    @shopping_list = {}
    @cook_book = []
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

  def print_shopping_list
    print_list = ""

    @shopping_list.each {|ingredient, quantity| print_list << "* #{ingredient}: #{quantity}\n"}

    print_list.chop
  end

  def add_to_cookbook(recipe)
    @cook_book << recipe
  end

  def has_all_ingredients(ingredients_list)
    ingredients_list.to_a.all? do |ingredient|
      @stock[ingredient[0]] && @stock[ingredient[0]] >= ingredient[1]
    end
  end


  def what_can_i_make
    recipes = @cook_book.select do |recipe|
      has_all_ingredients(recipe.ingredients)
    end
    recipes.map {|recipe| recipe.name}
  end

  def how_many_can_i_make
  end
end
