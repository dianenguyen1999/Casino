require_relative 'blackjack.rb'
require_relative 'intro.rb'
require_relative 'slots.rb'
# require_relative 'war.rb'


# intro
sleeper

puts "What is your name?"
@name = gets.strip.to_s
puts "How old are you?"
@age = gets.strip.to_i
puts "How much money do you have"
@money = gets.strip.to_i
puts "What game would you like to play?"

# user class
class Player
  attr_accessor :name, :money, :age

  def initialize(name, money, age)
    @name = name
    @money = money
    @age = age  
    
  end
end

# instanciate the player
@player = Player.new(@name, @money, @age)


# menu method
def menu 

  puts "
  1) War
  2) Blackjack
  3) Slots
  4) quit
  "

# user selection
  @game = gets.strip.to_i

# game selection logic
  case @game
  when 1
    puts "you selected war"
  when 2
# call blackjack and pass in the player class as an argument
    blackjack(@player)
  when  3
    puts "you select slots"
    slots_game = Slot.new(@name, @money)
  when 4
    puts "Thanks for coming to the Casino! Goodbye."
    exit
  else
    puts "invalid input"
  end
end

# start the menu
menu


