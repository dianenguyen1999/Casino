
require_relative "blackjack"
require_relative "intro"
require_relative "slots"
require_relative 'war.rb'

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
    4) View wallet. add/remove funds
    5) quit
    "
    @game = gets.strip.to_i
    
    # game selection logic
    case @game
    when 1
      puts "you selected war"
    when 2
      Blackjack.new(@name, @wallet_balance, @age)
    when 3
      Slot.new(@name, @wallet_balance, @age)
    when 4
      show_wallet
    when 5
      puts "Thanks for coming to the Casino! Goodbye."
      exit
    else
      puts "invalid input"
    end
  end

  def add_remove_funds
  end

  def show_wallet
    #user can view wallet and add funds if needed
    puts `clear`
    puts "Your current wallet balance is $#{@wallet_balance}"
    puts 
    puts "Would you like to
    1) Add more funds
    2) Remove funds
    3) Return to main menu
    "
    user_choice = gets.strip.to_i
    case user_choice
    when 1
      add_funds
    when 2
      remove_funds
    when 3
      menu
    else 
      puts "Invalid choice, try again"
      show_wallet
    end
  end
  
  def add_funds
    #add money to wallet
    puts "How much would you like to add?"
    money_to_add = gets.strip.to_i
    
    if money_to_add >= 1000
      puts "Lol right ..."
      add_funds
    else
      @wallet_balance += money_to_add
    end
    puts "New balance: $#{@wallet_balance}"
    sleep 1
    menu
  end
  
  def remove_funds
    #takes money out of online balance
    puts "How much would you like to remove?"
    money_to_remove = gets.strip.to_i
    
    if money_to_remove >= @wallet_balance
      puts "Lol right ... check your numbers pal"
      remove_funds
    else
      @wallet_balance -= money_to_remove
    end
    puts "New balance: $#{@wallet_balance}"
    sleep 1
    menu
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
  
  
  