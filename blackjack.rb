
# require_relative 'cards.rb'
# deal
# stay or hit?
# hit ---> check if you busted?  stay ------> total score and compare to dealer and ask if want to play again
# if busted ----> game over
# if okay ----> deal

# Track Player and Dealer scores
  # player current score
  @player_current_score = 0;
  # dealer current score
  @dealer_current_score = 0;
  #whos turn is it, dealer or player
  @users_turn = true 
  # did use choose to stay_or_hit
  @user_stay = false 
  # lock in score at time of stay 
  @player_stay_score = 0


# METHODS
# deal method start
def deal
# types of cards and their values
@cards = [
  {type: 'Ace', suit: ['♠️', '♥️', '♣️', '♥️'], value: 1},
  {type: '2', suit: ['♠️', '♥️', '♣️', '♥️'], value: 2},
  {type: '3', suit: ['♠️', '♥️', '♣️', '♥️'], value: 3},
  {type: '4', suit: ['♠️', '♥️', '♣️', '♥️'], value: 4},
  {type: '5', suit: ['♠️', '♥️', '♣️', '♥️'], value: 5},
  {type: '6', suit: ['♠️', '♥️', '♣️', '♥️'], value: 6},
  {type: '7', suit: ['♠️', '♥️', '♣️', '♥️'], value: 7},
  {type: '8', suit: ['♠️', '♥️', '♣️', '♥️'], value: 8},
  {type: '9', suit: ['♠️', '♥️', '♣️', '♥️'], value: 9},
  {type: '10', suit: ['♠️', '♥️', '♣️', '♥️'], value:10},
  {type: 'Jack', suit: ['♠️', '♥️', '♣️', '♥️'], value: 10},
  {type: 'Queen', suit: ['♠️', '♥️', '♣️', '♥️'], value: 10},
  {type: 'King', suit: ['♠️', '♥️', '♣️', '♥️'], value: 10},
]

# get random card from the deck for player
@player_card = @cards[rand(0...(@cards.length - 1))]
# players score
@player_value = @player_card[:value]
# get score total for player
@player_total = @player_value + @player_current_score
# get random card from the deck for the dealer
@dealer_card = @cards[rand(0...(@cards.length - 1))]
# dealers score
@dealer_value = @dealer_card[:value]
# get score total for dealer
@dealer_total = @dealer_value + @dealer_current_score
  
  if @user_stay == true
    puts "Stay. Score is: #{@player_stay_score}"
  end
  if @user_stay == false
    puts "Your card is a #{@player_card[:type]} of #{@player_card[:suit][rand(0...3)]}"
    puts "Dealer card is a #{@dealer_card[:type]} of #{@dealer_card[:suit][rand(0...3)]}"
    print "You are at #{@player_total}        Dealer score: #{@dealer_total}"
    puts ""
  end


# call stay or hit method
stay_or_hit
end
# deal method end

# stay_or_hit method start
def stay_or_hit

  puts "Do you want to stay or hit?(s/h)"

# variables
  @stay = false
  @hit = false

# get input from player
  @choice = gets.strip.to_s.downcase

# users turn
  if @users_turn
# handle selection
case 
when @choice == 's'
  @player_stay_score = @player_total
  puts "Player has chosen to stay. Score is: #{@player_total}"
  @stay = true
  @user_stay = true
when @choice == 'h'
  @hit = true
else
  puts "Invalid selection"
  stay_or_hit
end
    
# handle stay
if @stay 
      @user_stay == true;
    end
# handle hit
    if @hit
      puts "HIT!"
      @player_current_score = @player_total
    end
  end
  # did player bust or win?
     score_check(@player_total, @player.name.capitalize)
     score_check(@dealer_total,'Dealer')
end
# stay_or_hit method end

# score_check method start
def score_check(score, user)
  puts "#{user} score is #{score}"
  deal
end








def blackjack(player) 
  print "Welcome to BlackJack #{player.name.capitalize}! "
  puts "You currently have $#{player.money}"
  puts "Ready to deal?(y/n)"
  @ready = gets.strip.to_s.downcase

  if @ready === 'y'
    # deal the cards
    deal
    # stay or hit sequence

  else
    puts "no go"
  end
  
end







# Deal the cards
# deal
# puts "Your card is a #{@player_card[:type]} of #{@player_card[:suit][rand(0...3)]}"
# puts "Dealer card is a #{@dealer_card[:type]} of #{@dealer_card[:suit][rand(0...3)]}"
# print "You are at #{@player_value}        Dealer score: #{@dealer_value}"
# puts ""

