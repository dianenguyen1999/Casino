# Black Jack Game

# Track Player and Dealer scores globally
  # player current score
  @player_current_score = 0;
  # dealer current score
  @dealer_current_score = 0;
  # did use choose to stay_or_hit
  @user_stay = false 
  # lock in score at time of stay 
  @player_stay_score = 0
  @dealer_stay_score = 0











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
    print "You are at #{@player_total}        Dealer score: #{@dealer_total}"
    puts "" #line break

# run method to check the scores
score_check(@player_total, @dealer_total)

end
# deal method end








# score_check method start
def score_check(p_score, d_score)
  
if p_score > 21 then
    puts "#{@player.name} BUSTED!! You lose."
    elsif d_score > 21 then
      puts "Dealer BUSTED!! YOU WIN!!"
    elsif p_score == 21 then
      puts "YOU GOT BLACKJACK!!!"
  elsif p_score < 21 && !@user_stay then
#do the stay or hit method
    stay_or_hit
    # deal
      elsif d_score < 21 && @user_stay then
        if d_score > p_score then
          puts "You lost. House wins."
        elsif p_score > d_score
        puts "You WON!!"
        end
      else
        puts "something else happened, sorry."
        `ruby blackjack.rb`
  end
end
# check score method end












# stay_or_hit method start
def stay_or_hit

  puts "Do you want to stay or hit?(s/h)"
@choice = gets.strip.to_s
# handle Stay
  if @choice == 's'
  # set flag that player has stayed
    @user_stay = true;
# set current score to the total score so that you can get the current total
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
    # run score check
    score_check(@player_stay_score,@dealer_stay_score)
    puts "Dealer card is a #{@dealer_card[:type]} of #{@dealer_card[:suit][rand(0...3)]}"
    print "You are at #{@player_stay_score}        Dealer final score: #{@dealer_stay_score}"
    puts "" # another line break
  end
  end
# handle Hit
if @choice == 'h'
  puts "HIT!" 
  @player_current_score = @player_total
  @dealer_current_score = @dealer_total
  deal
end
end
# stay_or_hit method end









def blackjack(player) 
  print "Welcome to BlackJack #{player.name.capitalize}! "
  puts "You currently have $#{player.money}"
  puts "Ready to deal?(y/n)"
  @ready = gets.strip.to_s.downcase

  if @ready === 'y'
    # deal the cards
    deal
  else
    puts "no go"
  end
end


