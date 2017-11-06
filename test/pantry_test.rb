require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

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
    pantry.restock("cheese" => 10)

    assert_equal 10, pantry.stock_check("cheese")
  end
end
