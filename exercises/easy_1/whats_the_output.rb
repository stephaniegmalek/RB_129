class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# Further Exploration
name = 42
fluffy = Pet.new(name)
name += 1
p fluffy.name
puts fluffy
puts fluffy.name
p name

=begin
The `#to_s` method call within the `#initialize` method on `line 5` assigns the 
`@name` instance variable to the return value of the argument `name` converted 
to a string. This allows the new string object `'42'` to have the `#upcase` 
method called on it without throwing an error. Within the object, and for all 
methods called on the object, the name is the sting object `'42'`. However, the 
`name` variable still exists outside of the `fluffy` object and can be manipulated
externally as well. Outside of the object, the value referenced by `name` has been
incremented to `43`.

=end