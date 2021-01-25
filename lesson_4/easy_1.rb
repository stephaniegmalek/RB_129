true.class
"hello".class
[1, 2, 3, "happy days"].class
142.class

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

mycar = Car.new
mycar.go_fast

mutruck = Truck.new
mutruck.go_fast

=begin
When we call the `#go_fast` method from an instance of the `Car` class, the string
printed includes the name of the type of vehicle we are using. How is this done?

On `line 8` in the `Speed` module we use `self.class`. `self` refers to the object
itself, in this case a `Car` object. We then invoke the `#class` method which is 
asking `self` to tell us its class, which is `Car`. Because we're using string 
interpolation, `#to_s` is automatically being called for us. 
=end

class AngryCat
  def hiss
    puts "HIssssss!!!"
  end
end

AngryCat.new

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

my_pie = Pizza.new("cheese")
p my_pie.instance_variables

apple = Fruit.new("banana")
p apple.instance_variables

class Cube
  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end
end

my_cube = Cube.new(2500)
p my_cube.volume

p my_cube.instance_variable_get("@volume")

# by default, #to_s` returns the object's class and an encoding of the object id

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
    # self refers to the object/instance/ calling object
  end
end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count # self refers to the class, this is a class method, Cat.cats_count
    @@cats_count
  end
end

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

my_bag = Bag.new("red", "leather")