class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_accessor :pets
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end

  def to_s
    @name
  end
end

class Shelter
  def initialize
    @adoptions = Hash.new(0)
    @animals_left = []
  end

  def add_animal_to_shelter(animal)
    @animals_left << animal
  end

  def adopt(owner, pet)
    @adoptions[owner.name] = owner.pets << pet
  end

  def print_adoptions
    @adoptions.each do |owner, pets|
      puts "#{owner} has adopoted the following pets:"
      puts pets
      puts
    end
  end
  
  def print_animals_available
    puts "The Animal Shelter has the following unadopted pets:"
    @animals_left.each { |pet| puts pet }
    puts
  end

  def number_of_available_animals
    @animals_left.size
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.add_animal_to_shelter(asta)
shelter.add_animal_to_shelter(laddie)
shelter.add_animal_to_shelter(fluffy)
shelter.add_animal_to_shelter(kat)
shelter.add_animal_to_shelter(ben)
shelter.add_animal_to_shelter(chatterbox)
shelter.add_animal_to_shelter(bluebell)

shelter.print_adoptions
shelter.print_animals_available
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal shelter has #{shelter.number_of_available_animals} unadopted pets."
