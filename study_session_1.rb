class Rectangle
  include Comparable
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    width * height
  end

  def <=>(other)
    area <=> other.area
  end
end

rect1 = Rectangle.new(6, 4)
rect2 = Rectangle.new(5, 5)

p rect2 > rect1 # true
p rect1 < rect2 # true

class Person
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def to_s
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

tom = Person.new('Tom', '66 inches', '125 lbs')
puts tom

