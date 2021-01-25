class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future
# "You will <choice>" randomly select one of 3 options

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future
# "You will <trip choice>" will randomly select one of 3 options in choice method
# defined in RoadTrip class
# every time Ruby tries to resolve a method name, it will start with the methods
# defined on the class you are calling. So even though the call to `#choices` happens
# in a method defined in `Oracle`, Ruby will first look for a definition of `#choices`
# in `RoadTrip`. 

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# Orange, Taste, Object, Kernal, BasicObject
# Orange.ancestors

# Hotsauce, Taste, Object, Kernal, BasicObject
# Hotsauce.ancestors

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

# excited_dog = "excited dog" # local variable, no prefix
# @excited_dog = "excited dog" # instance variable, prefixed with 1 `@`
# @@excited_dog = "excited dog" # class variable, prefixed with 2 `@`

class Television
  def self.manufacturer # class method because method name prefixed with `self.`
    # method logic
  end

  def model
    # method logic
  end
end

Television.manufacturer

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Cat.cats_count
cat1 = Cat.new('tabby')
Cat.cats_count
cat2 = Cat.new('black')
cat3 = Cat.new('grey')
Cat.cats_count

#`@@cats_count` is a class variable and is being used to keep track of how many
# `Cat` objects are institiated. We know this because of where in the code the 
# number is incremented. 

# Each time we create a new instance of the class `Cat` using `Cat.new`, during 
# the object creation process it will call the `initialize` method and that is where 
# we incrememnt the value of the `@@cats_count` variable. 

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Override the other play!"
  end
end

my_bingo = Bingo.new
p my_bingo.play

=begin 
Benefits of using OOP
Creating objects allows programmers to think more abstractly about the code they are writing.
Objects are represented by nouns so are easier to conceptualize.
It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
It allows us to easily give functionality to different parts of an application without duplication.
We can build applications faster as we can reuse pre-written code.
As the software becomes more complex this complexity can be more easily managed.
=end
