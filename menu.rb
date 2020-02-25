
require_relative "blackjack"
require_relative "intro"
require_relative "slots"
# require_relative 'war.rb'

def casino_start
  sleeper

  puts "What is your name?"
  @name = gets.strip.to_s
  puts "How old are you?"
  @age = gets.strip.to_i
  puts "How much money do you have"
  @wallet_balance = gets.strip.to_i
  puts "What game would you like to play?"
  @player = Player.new(@name, @wallet_balance, @age)
end

class Player
  attr_accessor :name, :wallet_balance, :age
  
  def initialize(name, wallet_balance, age)
    @name = name
    @wallet_balance = wallet_balance
    @age = age  
    
    menu
  end
  
  def menu 
    age_check
    puts "Casino Menu"
    puts 
    puts "
    1) War
    2) Blackjack
    3) Slots
    4) quit
    "
    @game = gets.strip.to_i
    
    # game selection logic
    case @game
    when 1
      puts "you selected war"
    when 2
      Blackjack.new(@name, @wallet_balance, @age)
      # blackjack(@name, @wallet_balance, @age)
    when 3
      puts "you select slots"
      Slot.new(@name, @wallet_balance, @age)
    when 4
      puts "Thanks for coming to the Casino! Goodbye."
      exit
    else
      puts "invalid input"
    end
  end
  
  def age_check
    if @age < 21
      puts "Maybe you should try the arcade down the road kid."
      sleep 3
      exit
    else
    end
  end
end
  
casino_start
  
  
  