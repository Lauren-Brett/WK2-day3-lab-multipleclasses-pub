class Customer

attr_reader :name, :wallet, :age, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drinks = []
    @drunkenness = 0
  end

  def check_enough_money_to_purchase(drink)
    return @wallet >= drink.price
  end

  def drink_counter()
    return @drinks.length
  end

  def increase_drink(drink)
    return @drinks.push(drink)
  end

#naming not true here as applys to food too
  def decrease_wallet(drink)
    return @wallet -= drink.price
  end

  def increase_drunkenness(drink)
    return @drunkenness += drink.alcohol_level
  end

  # def check_money_for_food(food)
  #   return @wallet >= food.price
  # end


end
