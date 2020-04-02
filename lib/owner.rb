require "pry.rb"

class Owner
  attr_reader :name, :species 
  @@all = []
  def initialize(name, species="human")
    @name = name
    @species = species
    save
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.filter { |cat| cat.owner == self }
  end
  
  def dogs 
    Dog.all.filter { |dog| dog.owner == self }
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end
  
  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy" }
  end
  
  def sell_pets 
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
end










