require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RecipeTest < Minitest::Test
  def test_it_has_a_name
    r = Recipe.new("Cheese Pizza")
    assert_equal "Cheese Pizza", r.name
  end

  def test_it_can_add_an_ingredient
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500) # 500 "UNIVERSAL UNITS"
    assert_equal ["Flour"], r.ingredient_types
    r.add_ingredient("Cheese", 1500)
    assert_equal ["Flour", "Cheese"], r.ingredient_types
  end

  def test_it_tracks_amount_of_a_recipe_required
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500)
    assert_equal 500, r.amount_required("Flour")
  end

  def test_it_can_add_to_shopping_list
    r = Recipe.new("Cheese Pizza")
    r.ingredients
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    r.ingredients
    pantry.add_to_shopping_list(r)
    assert_instance_of Hash, pantry.shopping_list
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
