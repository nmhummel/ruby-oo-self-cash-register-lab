
# We're going to create an Object Oriented Cash Register that can: 
# * Add items of varying quantities and prices * Calculate discounts 
# * Keep track of what's been added to it * Void the last transaction

# Note that a discount is calculated as a percentage off of the total cash register price 
# (e.g. a discount of 20 means the customer receives 20% off of their total price).

# Hint #1: Keep in mind that to call an instance method inside another instance method, 
# we use the self keyword to refer to the instance on which we are operating.

# class Person

#     attr_accessor :age
  
#     def initialize(age = 0)
#       @age = age 
#     end 
  
#     def birthday
#       self.age += 1
#     end
#   end 

require 'pry'

class CashRegister

    attr_accessor :total, :discount, :title, :price, :quantity, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @title = title
        @quantity = quantity
        @cart = []
    end

    def add_item(title, price, quantity=1)
        self.total += price*quantity 
        count = 0
        while count < quantity
          @cart << [title,price]
          count += 1
        end
        self.last_transaction = price*quantity
      
      end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @discount != 0
            self.total = total - total * discount / 100
            "After the discount, the total comes to $#{total}."
        end
    end

    def items
        titles_only = []
        @cart.each do |food|
            titles_only << food[0]
        end
       titles_only
        
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end


# Hint #2: The apply_discount requires some knowledge about working with an Integer versus 
# a Float in Ruby. Note that 100.class returns Integer while 100.0.class returns Float. 
# Ruby provides methods for changing an object of type Integer to a Float and vice versa.

# Hint #3: The void_last_transaction method will remove the last transaction from the total. 
# You'll need to make an additional attribute accessor and keep track of that last transaction
# amount somehow. In what method of the class are you working with an individual item?
