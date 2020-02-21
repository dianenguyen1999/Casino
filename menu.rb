require_relative 'blackjack.rb'
require_relative 'slots.rb'
require_relative 'war.rb'



puts "Hello welcome to the Casino app"
sleep 2
puts "What is your name?"
@name = gets.strip.to_s
puts "How old are you?"
@age = gets.strip.to_i
puts "How much money do you have"
@money = gets.strip.to_i
puts "What game would you like to play?"
@game = gets.strip.to_i

class Player
  attr_accessor :name, :money, :age

  def initialize
    @name = name
    @money = money
    @age = age  
  end
end



if @game == 1 

  blackjack
end