require './lib/recipe'
require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PantryTest < Minitest::Test
  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_is_initialized_with_empty_hash
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_has_stock_check
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("cheese")
  end

  def test_can_restock_when_stock_is_empty
    pantry = Pantry.new
    pantry.restock("cheese", 10)

    assert_equal 10, pantry.stock_check("cheese")
  end

  def test_can_restock_more_when_not_empty
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_it_can_add_to_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Spaghetti")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)


    assert_equal ({"Cheese" => 20, "Flour" => 20}), pantry.add_to_shopping_list(r)
  end

  def test_can_add_on_more_recipe_to_the_existing_recipe
    pantry = Pantry.new
    r = Recipe.new("Spaghetti")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)
    r2 = Recipe.new("Spaghetti")
    r2.add_ingredient("Spaghetti Noodles", 10)
    r2.add_ingredient("Marinara Sauce", 10)
    r2.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r2)

    assert_equal ({"Cheese" => 25, "Flour" => 20, "Spaghetti Noodles" => 10, "Marinara Sauce" => 10}), pantry.shopping_list
  end

  def test_it_can_print_out_a_shopping_a_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Spaghetti")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)
    r2 = Recipe.new("Spaghetti")
    r2.add_ingredient("Spaghetti Noodles", 10)
    r2.add_ingredient("Marinara Sauce", 10)
    r2.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r2)

    assert_equal "* Cheese: 25\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10", pantry.print_shopping_list
  end

  def test_can_add_to_a_cook_book
    pantry = Pantry.new
    # Building our recipe
    r1 = Recipe.new("Cheese Pizza")
    r2 = Recipe.new("Brine Shot")
    r3 = Recipe.new("Peanuts")
    # Adding the recipe to the cookbook
    pantry.add_to_cookbook(r1)
    pantry.add_to_cookbook(r2)
    pantry.add_to_cookbook(r3)

    assert_equal 3, pantry.cook_book.count
    assert_instance_of Recipe, pantry.cook_book.first
  end

  def test_can_determine_if_ii_stock_does_not_have_ingridients_list
    pantry = Pantry.new
    ingredients_list = {"cheese" => 50, "flour" =>  30}
    pantry.restock("cheese", 10)
    pantry.restock("flour", 50)

    assert_equal false, pantry.has_all_ingredients(ingredients_list)

  def test_can_determine_if_it_stock_has_ingridients_list
    pantry = Pantry.new
    ingredients_list = {"cheese" => 50, "flour" =>  30}
    pantry.restock("cheese", 100)
    pantry.restock("flour", 50)

    assert_equal true, pantry.has_all_ingredients(ingredients_list)
  end
  def test_can_choose_what_to_make
    pantry = Pantry.new
    # Building our recipe
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)
    r2 = Recipe.new("Brine Shot")
    r2.add_ingredient("Brine", 10)
    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)
    # Adding the recipe to the cookbook
    pantry.add_to_cookbook(r1)
    pantry.add_to_cookbook(r2)
    pantry.add_to_cookbook(r3)
    # Stock some ingredients
    pantry.restock("Cheese", 10)
    pantry.restock("Flour", 20)
    pantry.restock("Brine", 40)
    pantry.restock("Raw nuts", 20)
    pantry.restock("Salt", 20)
    # What can i make?
    assert_equal pantry.what_can_i_make,["Brine Shot", "Peanuts"]
    # How many can i make?
  end

  def test_can_determine_how_many_can_i_make
    pantry = Pantry.new
    # Building our recipe
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)
    r2 = Recipe.new("Brine Shot")
    r2.add_ingredient("Brine", 10)
    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)
    # Adding the recipe to the cookbook
    pantry.add_to_cookbook(r1)
    pantry.add_to_cookbook(r2)
    pantry.add_to_cookbook(r3)
    # Stock some ingredients
    pantry.restock("Cheese", 10)
    pantry.restock("Flour", 20)
    pantry.restock("Brine", 40)
    pantry.restock("Raw nuts", 20)
    pantry.restock("Salt", 20)
    # What can i make?
    assert_equal pantry.what_can_i_make,["Brine Shot", "Peanuts"]
    # How many can i make?
  end
end
end
