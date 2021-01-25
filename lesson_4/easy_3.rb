class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi
# "Hello"
hello = Hello.new
# hello.bye
# NoMethod Error
hello = Hello.new
# hello.greet
# Argument Error - expects 1 arguement but given 0
hello = Hello.new
hello.greet("Goodbye")
# "Goodbye"
Hello.hi
# NoMethod Error - no class method called `hi`

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end
cat2 = AngryCat.new(2, "Jake")
cat3 = AngryCat.new(3, "Cat")
cat2.name
cat2.age
cat3.name
cat3.age

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

tabby = Cat.new('tabby')
puts tabby

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
# tv.manufacturer NoMethodError, `::manufacturer` is a class method and can only be
# called on the class such as `Television.manufacturer`
tv.model

Television.manufacturer
# Television.model No Method Error `#model` is an instance method and can only be 
# called on instances / objects of the `Television` class so `tv.model`

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of #{brightness} and a color of #{color}"
  end
end