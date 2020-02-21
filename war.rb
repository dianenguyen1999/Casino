# require war.rb
#     def war
#         puts "Please select a number between"
#     end
# end




# class Player
#   attr_accessor :deck
#   attr_reader   :name

#   def initialize(name)
#     @name = name
#     @deck = []
#   end
# end

# class Game
#   def initialize(player1, player2)
#     @p1 = player1
#     @p2 = player2
#     setup
#   end

#   def setup
#     @starting_deck = Deck.new.shuffle
#     @starting_deck.each_with_index do |card, index|
#       if index.even?
#         @p1.deck << card
#       else
#         @p2.deck << card
#       end
#     end
#   end

#   def play
#     counter = 1
#     until @p1.deck.empty? || @p2.deck.empty?
#       if @p1.deck.first > @p2.deck.first
#         @p1.deck << @p1.deck.shift
#         @p1.deck << @p2.deck.shift
#       elsif @p2.deck.first > @p1.deck.first
#         @p2.deck << @p2.deck.shift
#         @p2.deck << @p1.deck.shift
#       else
#         @p1.deck << @p1.deck.shift
#         @p2.deck << @p2.deck.shift
#       end
#       counter += 1
#     end
#   end

#   def result
#     @p1.deck.empty? ? winner = @p2 : winner = @p1
#     puts "#{winner.name} is the winner!"
#   end
# end

# class Deck
#   BASE = []

#   [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].each do |number|
#     4.times do
#       BASE << number
#     end
#   end

#   def shuffle
#     BASE.shuffle
#   end
# end

# player1 = Player.new("carson")
# player2 = Player.new("jonathan")
# game = Game.new(player1, player2)
# game.play
# game.result


class player
