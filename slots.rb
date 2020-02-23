#this will be the slot machine
require_relative "menu.rb"

class SlotMachine
  attr_accessor :symbol, :value

  def initialize (symbol, value)
    @symbol = symbol
    @value = value
  end
end

class Slot
  attr_accessor :name, :wallet_balance

  def initialize(name, wallet_balance)
    @name = name
    @wallet_balance = wallet_balance

    @slot_wheel = [
      SlotMachine.new("Apple", 10),
      SlotMachine.new("Diamond", 20),
      SlotMachine.new("Puppy", 30),
      SlotMachine.new("Gold", 40),
      SlotMachine.new("Treasure Chest", 50),
      SlotMachine.new("Monkey", 60),
      SlotMachine.new("Ice Cream Cone", 70),
    ]
    
    greeting 
  end
  
  def greeting
    #inital greeting to welcome user to slots and start the game. 
    puts `clear`
    puts 
    design_thing
    print "Hello #@name, you have entered the slot machine."
    design_thing
    puts 
    design_thing
    print "You have a current wallet balance of #@wallet_balance."
    design_thing
    sleep 1
    puts
    slots_menu
  end
  
  def slots_menu
    puts 
    design_thing
    print 'Main Menu'
    design_thing
    puts 
    
    puts "
    1) Show player current wallet/add funds
    2) View game rules and payouts
    3) Spin the wheel
    4) Exit back to casino menu
    "
    user_choice = gets.strip.to_i
    
    case user_choice
    when 1
      show_wallet
    when 2
      view_rules
    when 3
      choose_bet
      spin
    when 4 
      exit_to_main
    else 
      error
      slots_menu
    end 
  end
  
  def show_wallet
    #user can view wallet and add funds if needed
    puts `clear`
    puts "Your current wallet balance is $#{@wallet_balance}"
    puts 
    puts "Would you like to
    1) Add more funds
    2) Return to main menu
    "
    user_choice = gets.strip.to_i
    case user_choice
    when 1
      add_funds
    when 2
      slots_menu
    else 
      error
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
    puts "New balance: #{@wallet_balance}"
    sleep 1
    slots_menu
  end
  
  def view_rules
    #user can see how game is played and the payouts 
    puts `clear`
    design_thing
    print "Game Rules"
    design_thing
    puts 
    puts "The rules of the game are simple. Each time you spin the wheel, your bet will stay the same unless you change it. 
    The payouts depend on the symbols you get. 
    3 matches, you win big! 10:1
    2 matches, still pretty solid! 3:1
    0 matches, well ... you get to play again.
    Fund will automatically be added/deducted from your account.
    
    Good Luck"
    
    puts "Press enter to exit"
    user_choice = gets.strip.to_i
    user_choice == [0-9]? slots_menu : slots_menu
  end
  
  def choose_bet
    #allows user to choose bet.
    puts "How much would you like to bet each roll?"
    @bet_amount = gets.strip.to_i
    @bet_amount > 0? balance_check : choose_bet
  end
  
  def balance_check
    #checks to make sure user have enough in wallet. 
    if @bet_amount>@wallet_balance
      error2
      puts "Would you like to
      1) adjust bet?
      2) back to menu to add funds?"
      user_choice = gets.strip.to_i
      
      case user_choice
      when 1
        choose_bet
      when 2
        slots_menu
      else 
      end
    else
      spin
    end
  end
  
  def spin
    puts 
    design_thing
    print "Spinning"
    design_thing
    puts
    sleep 1
    design_thing
    print "Spinning"
    design_thing
    puts
    sleep 1
    design_thing
    print "Spinning"
    design_thing
    puts
    sleep 1
    
    user_roll = []
    3.times do 
      user_roll<<@slot_wheel[rand(6)].symbol
      
    end
    puts user_roll
    payouts(user_roll)
  end
  
  def payouts(arr)
    if arr.uniq.length == 3
      @wallet_balance -= (@bet_amount)
      puts "Better luck next roll!"
    elsif arr.uniq.length == 2
      @wallet_balance += (@bet_amount * 3)
      puts "Great bet!"
    elsif arr.uniq.length == 1
      @wallet_balance += (@bet_amount * 10)
      puts "JACKPOT!!!!!!!!!!!!!!!"
    else
      puts "error"
    end
    puts "wallet balance: #{@wallet_balance}"
    spin_again
  end
  
  def spin_again
    puts "Spin again?"
    user_choice = gets.strip
    if user_choice === 'yes'
      balance_check
    else
      slots_menu
    end
  end
  
  def exit
    #link back to the menu on menu.rb
  end
  
  def error
    puts "That is not a correct answer. Try again"
  end
  
  def error2
    puts "Your bet is larger than your wallet balance. You will need to add additional funds or change your bet amount." 
  end 
  
  def design_thing
    #Styles the questions so they stand out
    
    4.times do 
      print "--"
    end
  end

end

# carson = Slot.new('carson', 100)
#the call needs to take inputs from the main menu.  