class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

ben = BankAccount.new(50)
ben.positive_balance?
# because of the `#attr_reader` method for the `@balance` instance variable on `line 2`, 
# Ruby will auto create a getter method called `balance` that returns the value of the 
# `@balance` instance variable. The body of the `#positve_balance?` method will evaluate
# to calling the `#balance` method of the class, which will return the value of the 
# `@balance` instance variable. 

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
=begin
the mistake is on `line 31`, they look to be trying to call a setter method
for the `@quantity` instance variable that doesn't exist. There are 2 ways we
could fix:
1. we can reference the instance variable directly: 
   `@quantity = updated_count if updated_count >= 0`. 
2. we can change the `attr_reader` to `attr_accessor` and then prepend `self` to 
   `quantity` on `line 31`:
   `self.quantity = updated_count if udated_count >= 0`

The second fix could be problematic because it alters the public interface of the
class. This fix allows users of the class to change the quantity directly (calling 
the accessor with the `instance.quantity = <new_value>` notation ) rather than
going through the `#update_quantity` method. It means that the protection built 
into the `#update_quantity` method can be circumvented and possibly pose problems
down the line. 
=end

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling = @filling_type ? @filling_type : 'Plain'
    glaze = @glazing ? " with #{@glazing}" : ''
    filling + glaze
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
#   # => "Plain"
# puts donut2
#   # => "Vanilla"
# puts donut3
#   # => "Plain with sugar"
# puts donut4
#   # => "Plain with chocolate sprinkles"
# puts donut5
  # => "Custard with icing"

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

comp = Computer.new
comp.create_template
p comp.show_template

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end