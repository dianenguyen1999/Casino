def greeting
    puts "Welcome to the DUMMY POKER! (づ｡◕‿‿◕｡)づ"

    puts "Main menu (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧"

    puts " 
    1) View game rules for DUMMY POKER! ♨(⋆‿⋆)♨
    2) Start Game ᕙ(⇀‸↼‶)ᕗ
    3) Exit (╹◡╹)凸"

    user_input = gets.strip.to_i 
    case user_input
      when 1 
        view_rules
      when 2 
          start_game
      when 3
    Player.new(@name, @wallet_balance, @age)
      else
        puts "incorrect choice, try again"
        greeting
    end
  end



def view_rules
    puts "Basically each player is given two cards, 
            if your card is higher than your opponents you win,
            you can then choose to bet money or exit out of the game
            and let your opponent win!!"  
        sleep 5       
        greeting 
    end



    
    def start_game
        # instantiate a new deck
        @d = Deck.new
        deal_cards
        comparison
    end    

    def deal_cards
        @computer = []
        @player1 = []

        @computer = @d.get_random_card #grab one deck from card for computer
        @player1 = @d.get_random_card

        puts "COMPUTER #{@computer.rank} #{@computer.suit} (#{@computer.color})"
        puts "PLAYER  #{@player1.rank} #{@player1.suit} (#{@player1.color})"
    end
    
    
    
    
    def comparison
      puts "Who is going to win??"
      if @computer.rank >= @player1.rank 
        puts "You lose" 
        bet_money
      elsif @player1 >= @computer.rank
        puts "You win"
        bet_money
      end
      # puts "bet_money"
      # bet_money
    end
    
    # def bet_money 
    # puts "What would you like to do?"
    #   user_input = gets.strip.to_i
    #   case user_input
    #   when 1
    #     bet_moneys
    #   puts "how much would you like to bet?"
    #   user_bet = gets.strip.to_i
    #   puts "You bet this much money! #{$user_bet}"
    #   when 2 
    #     give_up!
    #     puts "Or would you like to give up and let your opponent win?"
    #     user_bet - gets.strip.to_i
    #   end
    # end 

    def bet_money 
      puts "Would you like to take the loss/win?
      Or would you like to bet money and keep going?? ᕦ(ò_óˇ)ᕤ
      IF SO, BET YOUR MONEYS"
      user_input = gets.strip.to_i
      case user_input
      when 1
        bet_moneys
      end
      puts "how much money would you like to bet?"
      user_input = gets. strip.to_i
      puts "You bet this much money! #{$user_input}"
      comparison
    end


    
    
    
    
    

#would you like to bet more or would you like to (or fixed bet)



#if computer is greater than player 1 (comparison )
# besides ace, queen, king, jack, they don't have value, assign value (king beats queen ex. )




    
    class Card
        # Getter and Setter methods for rank, suit and color
        attr_accessor :rank, :suit, :color
        # Gets called when you call the new method to create an instance
        # card = Card.new('10', 'Spades', 'Black')
        def initialize(rank, suit, color)
          @rank = rank
          @suit = suit
          @color = color
        end
       end


       class Deck
        # Getter and Setter methods for rank, suit and color
        attr_accessor :cards
       
        # Gets called when you call the new method to create an instance
        # deck = Deck.new
        def initialize
          @ranks = %w(1 2 3 4 5 6 7 8 9 10 11 12)
          @suits = %w(Spades Diamonds Clubs Hearts)
          @cards = []
          generate_deck
        

        end
       
        def shuffle_cards
         @cards.shuffle
        end
        
        def generate_deck
          @suits.each do |suit|
            @ranks.size.times do |i|
              # Ternary Operator
              color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
              @cards << Card.new(@ranks[i], suit, color)
            end
          end
        end
       
         def display_cards
           @cards.shuffle.each do |card|
             puts "#{card.rank} #{card.suit} (#{card.color})"
           end
         end

         def get_random_card
            @cards.shuffle.sample 
        end
       end

      #  greeting # every method has to be called in the end in order for it to be ran

class War
  attr_accessor :name, :wallet_balance, :age
  
  def initialize(name, wallet_balance, age)
   @name = name
   @wallet_balance = wallet_balance
   @age = age
# launch the game
  #  war(@name, @wallet_balance, @age)
   greeting
  end
end


