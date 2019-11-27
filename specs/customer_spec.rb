require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')
require_relative('../food')

class TestCustomer < Minitest::Test

  def setup
    @customer1 = Customer.new("Lauren", 1000, 18)
    @customer2 = Customer.new("Chloe", 1, 18)
    @drink = Drink.new("Long Island Tea", 20, 20)
    @food = Food.new("Chips", 5, 50)
  end


  def test_get_customer_name
    assert_equal("Lauren", @customer1.name)
  end

  def test_customer_wallet
    assert_equal(1000, @customer1.wallet)
  end

  def test_customer_has_enough_money
    assert_equal(true, @customer1.check_enough_money_to_purchase(@drink))
  end

  def test_customer_does_not_have_enough_money_to_buy_drink
    assert_equal(false, @customer2.check_enough_money_to_purchase(@drink))
  end

  def test_drink_counter_start_at_zero
    assert_equal(0, @customer1.drink_counter)
  end

  def test_drink_array_has_increase_by_one_drink
    @customer1.increase_drink(@drink)
    assert_equal(1, @customer1.drink_counter)
  end

  def test_customer_wallet_decreases_by_price_of_drink
    @customer1.decrease_wallet(@drink)
    assert_equal(980, @customer1.wallet)
  end

  def test_customer_age
    assert_equal(18, @customer1.age)
  end

  def test_customer_drunkenness
    assert_equal(0, @customer1.drunkenness)
  end

  def test_customer_drunkenness_increases_with_a_drink
    @customer1.increase_drunkenness(@drink)
    assert_equal(20, @customer1.drunkenness)
  end


def test_customer_has_enouch_money_to_buy_food
  assert_equal(true, @customer1.check_enough_money_to_purchase(@food))
end

def test_customers_wallet_decreases_by_price_of_food
  @customer1.decrease_wallet(@food)
  assert_equal(995, @customer1.wallet)
end

def test_intake_of_food_reduces_drunkenness
  @customer1.check_enough_money_to_purchase(@food)
  @customer1.decrease_wallet(@food)
  @customer1.increase_drunkenness(@drink)
  @customer1.increase_drunkenness(@drink)
  @customer1.increase_drunkenness(@drink)
  @customer1.increase_drunkenness(@drink)
  @customer1.increase_drunkenness(@drink)

  # reduced_drunkenness = @customer1.drunkenness()

  assert_equal(100, @customer1.drunkenness)
end


end
