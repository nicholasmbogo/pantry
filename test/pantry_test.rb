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
    r = Recipe.new("Cheese Pizza")
    r.ingredients
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    r.ingredients
    #pantry.add_to_shopping_list(r)
    assert_instance_of , pantry.add_to_shopping_list(r)
  end

  # def test_can_print_a_shopping_listy
  #   skip
  #   r = Recipe.new("Spaghetti")
  #   r.add_ingredient("Spaghetti Noodles", 10)
  #   r.add_ingredient("Marinara Sauce", 10)
  #   r.add_ingredient("Cheese", 5)
  #   pantry.add_to_shopping_list(r)
  #   pantry.shopping_list
  #   assert_equal {}, pantry.print_shopping_list
  # end
end
