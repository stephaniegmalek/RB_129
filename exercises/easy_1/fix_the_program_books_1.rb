class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

#Further Exploration:
# Accessor methods are plain instance methods, however, their main purpose is 
# to access an instance variable.

# attr_reader
# Acts as a getter method. This is the same as:

def name
  @name
end

# attr_writer
# Acts as a setter method. This is the same as:

def name=(new_name)
  @name = new_name
end

# attr_accessor
# Acts a both a getter and setter methods. This is the same as:

def name=(new_name)
  @name = new_name
end

def name
  @name
end

# Why use attr_reader?

# In this example, we chose to use attr_reader because we're only wanting to 
# retrieve(get) the instance variable's @author and @title.

# If we changed this from attr_reader to attr_writer instead, we'd get an error 
# prompting an undefined method title, because we aren't able to get the value 
# of an instance variable back.

# We could however, use attr_accessor since it includes a getter method, but it 
# wouldn't be ideal - especially if we didn't want someone to reassign the data 
# of our object (book).

# Advantages of using attr_ methods

# If you use attr_* methods, all they can ever do is set or get the value of that
# instance variable. If you make custom getters and setters, then you have the 
# option to do some work on those instance variables before returning or setting 
# a value from within the getter/setter. Tyler Lippert (TA) Imported from Slack Student Channel