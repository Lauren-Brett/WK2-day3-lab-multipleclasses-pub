require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food')

class TestFood < Minitest::Test

def setup
  @food = Food.new("Chips", 5, 50)
end

def test_food_is_chips
  assert_equal("Chips", @food.name)
end



end
