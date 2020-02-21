# emojis
# 💰 💸 💵 🚬 🎉 🎊 ♠️ ♣️ ♥️ ♦️

# intro method
def sleeper
  puts `clear`
  puts ""
  print "🎉 Hello 🎉    "
  sleep 0.7

  @words = ["Welcome", "to", "the"]
  @words.each do |word|
    print "#{word.upcase} 🎊     "
    sleep 0.5
  end

# new line
puts ""
puts ""

# across emojis
  (0...10).each do |num|
    print "💵 "
    sleep 0.05
  end
# new line
  puts ""
# down emojis
  (0...6).each do |num|

    if num == 3
      puts "💰💰💰  CASINO  💰💰💰"
    end

    puts "🚬 "
    sleep 0.2
  end

  (0...10).each do |num|
    print "💵 "
    sleep 0.05
  end
  puts ""
end
