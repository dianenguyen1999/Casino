#this will be the slot machine

# build class that gives new key value, of number and symbol
# build out spinning the wheel
# allow user to determine bet amount 
# determine payouts for x number of matches. 

module Game

end

class SlotMachine
  attr_accessor :symbol, :value

  def initialize (symbol, value)
    @symbol = value
    @value = value
  end
  # def create_hash
  #   new_hash = 
  #   new_hash{symbol:} = @symbol
  #   new_hash{'value'} = @value
  #   return new_hash
  # end
end

class Slot
  attr_accessor :name, :wallet_balance

  def initialize(name, wallet_balance)
    @name = name
    @wallet_balance = wallet_balance

    create_wheel
    greeting 
  end
  
  def create_wheel
    @@slot_wheel = Hash[
      :apple, 1,
      :diamond, 2,
      :gold, 3,
      :treasure_chest, 4,
      :puppy, 5,
    ]
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
    sleep 3

    # CALL GAME METHOD!!!!!!!!!!!!!!!!!!!!!!!!!! HERE


  end

  def design_thing
    #Styles the questions so they stand out
    4.times do 
      print "--"
    end
  end

end

carson = Slot.new('Carson', 100.00)