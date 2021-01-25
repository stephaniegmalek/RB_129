class Transform
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def uppercase
    data.upcase
  end

  def self.lowercase(input)
    input.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')