class CircularQueue_Original
  attr_reader :buffer, :oldest_position, :current_position

  def initialize(size)
    @buffer = Array.new(size)
    @current_position = 0
    @oldest_position = 0
  end

  def enqueue(element)
    increment_oldest_position unless @buffer[@current_position] == nil
    @buffer[@current_position] = element
    increment_current_position
  end

  def dequeue
    element = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    increment_oldest_position unless element == nil
    element
  end

  def increment_oldest_position
    @oldest_position = (@oldest_position + 1) % @buffer.size
  end

  def increment_current_position
    @current_position = (@current_position + 1) % @buffer.size
  end
end

class CircularQueue
  attr_accessor :buffer

  def initialize(size)
    @buffer = []
    @max_size = size
  end

  def enqueue(element)
    dequeue if @buffer.size == @max_size
    @buffer.push(element)
  end

  def dequeue
    @buffer.shift
  end
end

queue = CircularQueue.new(3)
p queue.buffer
puts queue.dequeue == nil
# p queue.oldest_position
# p queue.buffer

queue.enqueue(1)
# p queue.buffer
queue.enqueue(2)
# p queue.buffer
puts queue.dequeue == 1
# p queue.oldest_position
p queue.buffer

queue.enqueue(3)
# p queue.buffer
queue.enqueue(4)
p queue.buffer
puts queue.dequeue == 2 
# p queue.oldest_position
p queue.buffer

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
p queue.buffer
puts queue.dequeue == 5
# p queue.oldest_position
puts queue.dequeue == 6
# p queue.oldest_position
puts queue.dequeue == 7
# p queue.oldest_position
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil