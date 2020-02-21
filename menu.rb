require_relative 'blackjack.rb'
require_relative 'intro.rb'
# require_relative 'slots.rb'
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
  4) Quit
  "

# user selection
  @game = gets.strip.to_i

# game selection logic
  case
  when @game == 1
    puts "you selected war"
  when @game == 2
    blackjack(@player)
  when @game == 3
    puts "you select slots"
  when @game == 4
    puts "Thanks for coming to the Casino! Goodbye."
    exit
  else
    puts "invalid input"
  end
end

# start the menu
menu


