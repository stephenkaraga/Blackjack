
suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = cards.product(suits)

puts "Hello! Welcome to BlackJack World! What is your name?"
name = gets.chomp.downcase.capitalize!

puts "Alright, " + name + "! Let's get started. "

puts "------------ SHUFFLING CARDS ------------ "
puts "------------ SHUFFLING CARDS ------------ "
puts "------------ SHUFFLING CARDS ------------ "

deck_for_game1 = deck.shuffle

player_hand = []
dealer_hand = []

card1 = deck_for_game1.shift
card2 = deck_for_game1.shift
card3 = deck_for_game1.shift 
card4 = deck_for_game1.shift

players_hand_value = 0
dealers_hand_value = 0

player_hand.push(card1, card3)
dealer_hand.push(card2, card4)

def calculate_hand_value(cards)
  ace_count = 0
  hand_value = 0
  cards.each do |card|
    if card.first == 'A'
      ace_count = ace_count + 1
    end
  end
    cards.each do |card|
    card_value = card.first.to_i
      if card_value != 0
        hand_Value = hand_value + card_value
      elsif card_value == 0 && card.first != 'A'
        hand_Value = hand_value + 10
      else
        hand_value = hand_value + 11
      end
    end
    counter = ace_count
  while hand_value > 21 && counter > 0 
    hand_value = hand_value - 10
    counter = counter - 1
  end
  hand_value
end

players_hand_value = calculate_hand_value(player_hand)
dealers_hand_value = calculate_hand_value(dealer_hand)

puts "You are dealt the " + player_hand[0].first.to_s + " of " + player_hand[0].last.to_s 
puts "and the " + player_hand[1].first.to_s + " of " + player_hand[1].last.to_s + "." 
puts "Dealer is showing the " + dealer_hand[0].first.to_s + " of " + dealer_hand[0].last.to_s + "."
puts "Dealer has one other card that is face down."


puts "Would you like to hit or stand?"
input = gets.chomp
  
while input != 'hit' && input != 'stand'
  puts "Please enter hit or stand!"
  input = gets.chomp
end

if input.downcase == 'hit'
  card5 = deck_for_game1.shift
  player_hand.push(card5)
  players_hand_value = calculate_hand_value(player_hand)
  if players_hand_value > 21
    puts "Oh no!!! You busted! You lose the hand!"
  else
    puts "Hit or stand?"
    #askPlayerToHitOrStand

  end
elsif input.downcase == 'stand'
  if dealers_hand_value >= 17
  puts "Dealers stands. "
  puts "Dealer flips over other card."
  puts "Dealer has " + dealer_hand[0].first.to_s + " of " + dealer_hand[0].last.to_s
  puts "and " + dealer_hand[1].first.to_s + " of " + dealer_hand[1].last.to_s + "."
    if players_hand_value > dealers_hand_value
      puts "You win!!!"
    else
      puts "You lost the hand. Dealer wins!"
    end

  else
    puts "Dealer hits."
    card5 = deck_for_game1.shift
    dealer_hand.push(card5)
    dealers_hand_value = calculate_hand_value(dealer_hand)
    if dealers_hand_value > 21
      puts "Dealer busts. You win!"
    end
  end
end