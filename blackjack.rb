
# require_relative 'cards.rb'

# cards hashes of suit and their values
def deal
# types of cards and their values
@cards = [
  {type: 'Ace', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: [1,11]},
  {type: '2', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 2},
  {type: '3', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 3},
  {type: '4', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 4},
  {type: '5', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 5},
  {type: '6', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 6},
  {type: '7', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 7},
  {type: '8', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 8},
  {type: '9', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 9},
  {type: '10', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value:10},
  {type: 'Jack', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 0},
  {type: 'Queen', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 10},
  {type: 'King', suit: ['spades', 'diamonds', 'clubs', 'hearts'], value: 10},
]
# if ace method

# get random card from the deck for player
@player_card = @cards[rand(0...(@cards.length - 1))]
@player_value = @player_card[:value]
# @player_current_total = @player_value
@dealer_card = @cards[rand(0...(@cards.length - 1))]
@dealer_value = @dealer_card[:value]
# @dealer_current_total = @dealer_value
puts "Your card is a #{@player_card[:type]} of #{@player_card[:suit][rand(0...3)]}"
puts "Dealer card is a #{@dealer_card[:type]} of #{@dealer_card[:suit][rand(0...3)]}"
print "You are at #{@player_value}        Dealer score: #{@dealer_value}"
puts ""

end



def blackjack(player) 
  print "Welcome to BlackJack #{player.name.capitalize}! "
  puts "You currently have $#{player.money}"
  puts "Ready to deal?(y/n)"
  @ready = gets.strip.to_s.downcase

  if @ready === 'y'
    puts "leggo"

  else
    puts "no go"
  end
  
end

deal

