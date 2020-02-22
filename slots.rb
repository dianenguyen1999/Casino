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
    player_wallet
  when 2
    view_rules
  when 3
    spin
  when 4 
    exit_to_main
  else 
    puts "Wrong choice, try again"
    menu
  end 
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