#this will be the slot machine

# build class that gives new key value, of number and symbol
# build out spinning the wheel
# allow user to determine bet amount 
# determine payouts for x number of matches. 

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
    ]
    @user_roll = []

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
    menu
  end

  def menu
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
      spin
    when 4 
      exit_to_main
    else 
      error
      menu
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
      menu
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
      menu
    end
    
    def view_rules
      #user can see how game is played and the payouts 
      puts `clear`
      design_thing
      print "Game Rules"
      design_thing
      puts 
      puts "The rules of the game are simple. Each time you spin the wheel, you are betting $5.00. 
      The payouts depend on the symbols you get. 
      3 matches, you win big! 10:1
      2 matches, still pretty solid! 3:1
      0 matches, well ... you get to play again.
      Fund will automatically be added/deducted from your account.
      
      Good Luck"
      
      puts "Press any key then enter to exit"
      user_choice = gets.strip.to_i
      user_choice == [0-9]? menu : menu
  end

  def spin
    puts 
    design_thing
    print "Spinning"
    design_thing
    puts
    
    3.times do 
      @user_roll<<@slot_wheel[rand(4)].symbol
    end
    puts @user_roll
  end

  def error
    puts "That is not a correct answer. Try again"
  end

  def design_thing
    #Styles the questions so they stand out
    4.times do 
      print "--"
    end
  end

end

carson = Slot.new('Carson', 100.00)