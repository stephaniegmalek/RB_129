class Banner
  attr_reader :message, :width

  def initialize(message, width=76)
    @width = width
    @message = parse(message)
    
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def parse(message)
    i = 0
    parsed = []
    loop do
      parsed << "| #{message.slice(i, width).center(width)} |"
      i += width
      break if i > message.size
    end
    parsed
  end

  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    message.each do |msg_line|
      msg_line
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+



example = "to be or not to be. That is the question. Adding more words and stuff, need to test this out."
banner1 = Banner.new(example, 52)
puts banner1


  