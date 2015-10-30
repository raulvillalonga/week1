require 'pry'
class Item
	attr_accessor :name, :price
	def initialize(name, price)
		@name = name
		@price = price
	end
end

class Apple < Item
	def initialize
		super("apple", 5)
	end
end

class Orange < Item
	def initialize
		super("oranges", 5)
	end
end

class Grape < Item
	def initialize
		super("grapes", 15)
	end
end

class Banana < Item
	def initialize
		super("banana", 20)
	end
end

class Watermelon < Item
	def initialize
		super("watermelon", 50)
	end
end


class ShoppingCart
	def initialize(fruits)
		@items = []
		@fruits = fruits
	end

	def show
		puts @items.reduce(0){|sum, x| sum + x.price}
	end

	def cost
		puts "Cost = #{@items.reduce(0){|sum, x| sum + x.price}}"
	end

	def add_item_to_cart(item)
		@items << @fruits[item].new
	end

end

fruits = {apple: Apple}

sh = ShoppingCart.new(fruits)
sh.add_item_to_cart(:apple)
sh.cost

=begin
apples     10$
oranges     5$
grapes     15$
banana     20$
watermelon 50$

cart = ShoppingCart.new

cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana

cart.show
1 apple: 10$
2 bananas: 40$

cart.cost = 50
=end