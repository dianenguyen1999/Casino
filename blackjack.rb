# # Black Jack Game



# # GAME


# # start blackjack method
# def blackjack(name, money, age) 

# # 'GLOBAL' variables
#   # player current score
#   @player_current_score = 0;
#   # dealer current score
#   @dealer_current_score = 0;
#   # did use choose to stay_or_hit
#   @user_stay = false 
#   # lock in score at time of stay 
#   @player_stay_score = 0
#   @dealer_stay_score = 0
#   # extract data from the player class instance for use in play_again method
#   @player_name = ''
#   @player_age = 0
#   @player_money = 0


#   print "Welcome to BlackJack #{name.capitalize}! "
#   puts "You currently have $#{money.to_i}"
#   # extract data from the player passed in from menu
#   @player_name = name
#   @player_money = money
#   @player_age = age
# # comment


# # deal method start
# def deal
# # types of cards and their values
# @cards = [
#   {type: 'Ace', suit: ['♠️', '♥️', '♣️', '♥️'], value: 1},
#   {type: '2', suit: ['♠️', '♥️', '♣️', '♥️'], value: 2},
#   {type: '3', suit: ['♠️', '♥️', '♣️', '♥️'], value: 3},
#   {type: '4', suit: ['♠️', '♥️', '♣️', '♥️'], value: 4},
#   {type: '5', suit: ['♠️', '♥️', '♣️', '♥️'], value: 5},
#   {type: '6', suit: ['♠️', '♥️', '♣️', '♥️'], value: 6},
#   {type: '7', suit: ['♠️', '♥️', '♣️', '♥️'], value: 7},
#   {type: '8', suit: ['♠️', '♥️', '♣️', '♥️'], value: 8},
#   {type: '9', suit: ['♠️', '♥️', '♣️', '♥️'], value: 9},
#   {type: '10', suit: ['♠️', '♥️', '♣️', '♥️'], value:10},
#   {type: 'Jack', suit: ['♠️', '♥️', '♣️', '♥️'], value: 10},
#   {type: 'Queen', suit: ['♠️', '♥️', '♣️', '♥️'], value: 10},
#   {type: 'King', suit: ['♠️', '♥️', '♣️', '♥️'], value: 10},
# ]

# # get random card from the deck for player
# @player_card = @cards[rand(0...(@cards.length - 1))]
# # players score
# @player_value = @player_card[:value]
# # get score total for player
# @player_total = @player_value + @player_current_score
# # get random card from the deck for the dealer
# @dealer_card = @cards[rand(0...(@cards.length - 1))]
# # dealers score
# @dealer_value = @dealer_card[:value]
# # get score total for dealer
# @dealer_total = @dealer_value + @dealer_current_score
  
# # prints out players card info
#     puts "Your card is a #{@player_card[:type]} of #{@player_card[:suit][rand(0...3)]}"
# # prints out dealers card info
#     puts "Dealer card is a #{@dealer_card[:type]} of #{@dealer_card[:suit][rand(0...3)]}"
# # puts scores on one line for readability
#     print "You are at #{@player_total}        Dealer score: #{@dealer_total}       "
#     print "Money: #{@player_money}   Bet: (#{@bet})" 
#     puts "" #line break

# # run method to check the scores
# score_check(@player_total, @dealer_total)
# end
# # deal method end



# # score_check method start
# def score_check(p_score, d_score)
#   # first check did the player bust
# if p_score > 21 then
#     puts "#{@player_name} BUSTED!! You lose."
#     @player_money = @player_money -= @bet
#     puts "Your money #{@player_money}"
#     play_again
#     # then did the dealer bust
#     elsif d_score > 21 then
#       puts "Dealer BUSTED!! YOU WIN!!"
#       @player_money = @player_money += @bet
#     puts "Your money #{@player_money}"
#     play_again
#     # did player get blackjack
#     elsif p_score == 21 then
#       puts "YOU GOT BLACKJACK!!!     x3 payout!!!"
#       @player_money = @player_money += (@bet * 3)
#     puts "Your money #{@player_money}"
#     play_again
#     # is the player score less than 21 or bust and they aren't staying
#     elsif p_score < 21 && !@user_stay then
# #do the stay or hit method/deal
#     stay_or_hit
#     # is the dealers score less than 21 and the player has chosen to stay
#     elsif d_score < 21 && @user_stay then
#       # compare the scores now
#         if p_score < d_score then
#           puts "You lost. House wins."
#           @player_money = @player_money -= @bet
#           puts "Your money #{@player_money}"
#           play_again
#         elsif p_score > d_score
#         puts "You WON!!"
#         @player_money = @player_money += @bet
#         puts "Your money #{@player_money}"
#         play_again
#         elsif p_score == d_score
#           puts "Its a tie, You still win!"
#           @player_money = @player_money += @bet
#         puts "Your money #{@player_money}"
#     play_again
#         end
#       else
#         puts "something else happened, sorry."
#         exit_to_main
#   end
# end
# # check score method end




# # stay_or_hit method start
# def stay_or_hit

#   puts "Do you want to stay or hit?(s/h)"
# @choice = gets.strip.to_s.downcase
# # handle Stay
#   if @choice == 's'
#   # set flag that player has stayed
#     @user_stay = true;
# # we need this because total is made up of the current + value; this updates the total
#     @player_current_score = @player_total
# # lock in the current score since you are staying
#     @player_stay_score = @player_total
# # basically updating the dealer score to current
#     @dealer_current_score = @dealer_total
# # dealer logic
#     if @dealer_current_score >= 17 then
#   # locks in the dealers current score
#       @dealer_stay_score = @dealer_current_score
#       puts "Dealer stays."
#   # compares the dealer vs player scores
#       score_check(@player_stay_score,@dealer_stay_score)
#     else
# # if the dealer doesn't stay then it takes one more turn
#     @dealer_card = @cards[rand(0...(@cards.length - 1))] #gets new random card
#     @dealer_value = @dealer_card[:value] #gets new value from that new card
#     @dealer_total = @dealer_value + @dealer_current_score #adds that to the total
#     @dealer_stay_score = @dealer_total #sets that total to the stay score to compare
#     puts "Dealer card is a #{@dealer_card[:type]} of #{@dealer_card[:suit][rand(0...3)]}"
#     print "Your score: #{@player_stay_score}        Dealer final score: #{@dealer_stay_score}"
#     puts "" # another line break
#     # run score check
#     score_check(@player_stay_score,@dealer_stay_score)
#   end
#   end
# # handle Hit
# if @choice == 'h'
#   puts "          💥HIT!💥" 
#   @player_current_score = @player_total
#   @dealer_current_score = @dealer_total
#   sleep 1
#   deal
# else
#   puts "invalid input, sorry."
#   stay_or_hit
# end
# end
# # stay_or_hit method end



# # exit to main method
# def exit_to_main
#      Player.new(@player_name, @player_money, @player_age)
#   end
# # exit to main method end




# # play_again method start
# def play_again
# puts "Would you like to play again?(y/n)"
# # get user input
# input = gets.strip.to_s.downcase
# # handle input
#   if input === 'y' 
#     # rest everything to default
#     reset
#     # call black jack game method, essentially the deal method
#     blackjack(@player_name, @player_money, @player_age)
#   elsif input === 'n'
#     exit_to_main
#   else
#     puts "invalid input"
#     play_again
#   end
# end
# # play_again method end



# # reset method start
# def reset
#   # reset necessary values back to default
#   @player_current_score = 0;
#   @dealer_current_score = 0;
#   @user_stay = false 
#   @player_stay_score = 0
#   @dealer_stay_score = 0
# end
# # reset method end




# # handle bet start
# def handle_bet
# puts "Place your bet:"
#     @bet = gets.strip.to_i
# # has enough money
#     if @bet < @player_money
#       # deal the cards
#       deal
#     elsif @bet > @player_money
#       puts "Sorry you don't have enough money for that bet."
#       puts "Would you like to try a different bet?(y/n)"
#       @bet_again = gets.strip.to_s.downcase
#       if @bet_again == 'y'
#           handle_bet
#       else
#         puts "Come back when you have money turd."
#         exit_to_main
#       end
#     else
#       puts "Invalid input"
#     end
# end
# # handle_bet method end






  
#   puts "Ready to deal?(y/n)"
#   @ready = gets.strip.to_s.downcase
#   # check input
#   if @ready === 'y'
#     # run handle bet method
#     handle_bet
#   elsif @ready === 'n'
#     puts "Well, try again later."
#     exit_to_main
#   else
#     puts "invalid input"
#     exit_to_main
#   # creates a user with the same data to pass into blackjack method to retry
#     # @retry_user = Player_blackjack.new(@player_name,@player_age,@player_wallet_balance)
#     # blackjack(@retry_user)
#   end
# end
# # end blackjack method


# class Blackjack
#   attr_accessor :name, :wallet_balance, :age

#   def initialize(name, wallet_balance, age)
#     @name = name
#     @wallet_balance = wallet_balance
#     @age = age
# # launch the game
#     blackjack(@name, @wallet_balance, @age)
#   end
# end


# Black Jack Game



# GAME


# start blackjack method
def blackjack(name, money, age) 

# 'GLOBAL' variables
  # player current score
  @player_current_score = 0;
  # dealer current score
  @dealer_current_score = 0;
  # did use choose to stay_or_hit
  @user_stay = false 
  # lock in score at time of stay 
  @player_stay_score = 0
  @dealer_stay_score = 0
  # extract data from the player class instance for use in play_again method
  @player_name = ''
  @player_age = 0
  @player_money = 0


  print "Welcome to BlackJack #{name.capitalize}! "
  puts "You currently have $#{money.to_i}"
  # extract data from the player passed in from menu
  @player_name = name
  @player_money = money
  @player_age = age



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
  
# prints out players card info
    puts "Your card is a #{@player_card[:type]} of #{@player_card[:suit][rand(0...3)]}"
# prints out dealers card info
    puts "Dealer card is a #{@dealer_card[:type]} of #{@dealer_card[:suit][rand(0...3)]}"
# puts scores on one line for readability
    print "You are at #{@player_total}        Dealer score: #{@dealer_total}       "
    print "Money: #{@player_money}   Bet: (#{@bet})" 
    puts "" #line break

# run method to check the scores
score_check(@player_total, @dealer_total)
end
# deal method end



# score_check method start
def score_check(p_score, d_score)
  # first check did the player bust
if p_score > 21 then
    puts "#{@player_name} BUSTED!! You lose."
    @player_money = @player_money -= @bet
    puts "Your money #{@player_money}"
    play_again
    # then did the dealer bust
    elsif d_score > 21 then
      puts "Dealer BUSTED!! YOU WIN!!"
      @player_money = @player_money += @bet
    puts "Your money #{@player_money}"
    play_again
    # did player get blackjack
    elsif p_score == 21 then
      puts "YOU GOT BLACKJACK!!!     x3 payout!!!"
      @player_money = @player_money += (@bet * 3)
    puts "Your money #{@player_money}"
    play_again
    # dealer gets a blackjack
    elsif d_score == 21 then
      puts "Dealer has BLACKJACK! You LOSE."
    # is the player score less than 21 or bust and they aren't staying
    elsif p_score < 21 && !@user_stay then
#do the stay or hit method/deal
    stay_or_hit
    # is the dealers score less than 21 and the player has chosen to stay
    elsif d_score < 21 && @user_stay then
      # compare the scores now
        if p_score < d_score then
          puts "You lost. House wins."
          @player_money = @player_money -= @bet
          puts "Your money #{@player_money}"
          play_again
        elsif p_score > d_score
        puts "You WON!!"
        @player_money = @player_money += @bet
        puts "Your money #{@player_money}"
        play_again
        elsif p_score == d_score
          puts "Its a tie, You still win!"
          @player_money = @player_money += @bet
        puts "Your money #{@player_money}"
    play_again
        end
      else
        puts "something else happened, sorry."
        exit_to_main
  end
end
# check score method end




# stay_or_hit method start
def stay_or_hit

  puts "Do you want to stay or hit?(s/h)"
@choice = gets.strip.to_s.downcase
# handle Stay
  if @choice == 's'
  # set flag that player has stayed
    @user_stay = true;
# we need this because total is made up of the current + value; this updates the total
    @player_current_score = @player_total
# lock in the current score since you are staying
    @player_stay_score = @player_total
# basically updating the dealer score to current
    @dealer_current_score = @dealer_total
# dealer logic
    if @dealer_current_score >= 17 then
  # locks in the dealers current score
      @dealer_stay_score = @dealer_current_score
      puts "Dealer stays."
  # compares the dealer vs player scores
      score_check(@player_stay_score,@dealer_stay_score)
    else
# if the dealer doesn't stay then it takes one more turn
    @dealer_card = @cards[rand(0...(@cards.length - 1))] #gets new random card
    @dealer_value = @dealer_card[:value] #gets new value from that new card
    @dealer_total = @dealer_value + @dealer_current_score #adds that to the total
    @dealer_stay_score = @dealer_total #sets that total to the stay score to compare
    puts "Dealer card is a #{@dealer_card[:type]} of #{@dealer_card[:suit][rand(0...3)]}"
    print "Your score: #{@player_stay_score}        Dealer final score: #{@dealer_stay_score}"
    puts "" # another line break
    # run score check
    score_check(@player_stay_score,@dealer_stay_score)
  end
  end
# handle Hit
if @choice == 'h'
  puts "          💥HIT!💥" 
  @player_current_score = @player_total
  @dealer_current_score = @dealer_total
  sleep 1
  deal

else
  puts "invalid input, sorry."
  stay_or_hit
end
end
# stay_or_hit method end



# exit to main method
def exit_to_main
     Player.new(@player_name, @player_money, @player_age)
  end
# exit to main method end




# play_again method start
def play_again
puts "Would you like to play again?(y/n)"
# get user input
input = gets.strip.to_s.downcase
# handle input
  if input === 'y' 
    # rest everything to default
    reset
    # call black jack game method, essentially the deal method
    blackjack(@player_name, @player_money, @player_age)
  elsif input === 'n'
    exit_to_main
  else
    puts "invalid input"
    play_again
  end
end
# play_again method end



# reset method start
def reset
  # reset necessary values back to default
  @player_current_score = 0;
  @dealer_current_score = 0;
  @user_stay = false 
  @player_stay_score = 0
  @dealer_stay_score = 0
end
# reset method end




# handle bet start
def handle_bet
puts "Place your bet:"
    @bet = gets.strip.to_i
# has enough money
    if @bet < @player_money
      # deal the cards
      deal
    elsif @bet > @player_money
      puts "Sorry you don't have enough money for that bet."
      puts "Would you like to try a different bet?(y/n)"
      @bet_again = gets.strip.to_s.downcase
      if @bet_again == 'y'
          handle_bet
      else
        puts "Come back when you have money turd."
        exit_to_main
      end
    else
      puts "Invalid input"
    end
end
# handle_bet method end






  
  puts "Ready to deal?(y/n)"
  @ready = gets.strip.to_s.downcase
  # check input
  if @ready === 'y'
    # run handle bet method
    handle_bet
  elsif @ready === 'n'
    puts "Well, try again later."
    exit_to_main
  else
    puts "invalid input"
    exit_to_main
  # creates a user with the same data to pass into blackjack method to retry
    # @retry_user = Player_blackjack.new(@player_name,@player_age,@player_wallet_balance)
    # blackjack(@retry_user)
  end
end
# end blackjack method


class Blackjack
  attr_accessor :name, :wallet_balance, :age

  def initialize(name, wallet_balance, age)
    @name = name
    @wallet_balance = wallet_balance
    @age = age
# launch the game
    blackjack(@name, @wallet_balance, @age)
  end
end