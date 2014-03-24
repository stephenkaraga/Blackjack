
suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K',         'A']


deck = cards.product(suits)




#deck.shuffle # the deck is now shuffled


#cards = {'AC'=>11, '2C'=> 2, '3C'=>3, '4C'=>4, '5C'=>5, '6C'=>6, '7C'=>7, '8C'=>8, '9C'=>9, '10C'=>10, 'JC'=>10, 'KC'=>10, 'QC'=>10,
#		  'AD'=>11, '2D'=> 2, '3D'=>3, '4D'=>4, '5D'=>5, '6D'=>6, '7D'=>7, '8D'=>8, '9D'=>9, '10D'=>10, 'JD'=>10, 'KD'=>10, 'QD'=>10,
#		  'AH'=>11, '2H'=> 2, '3H'=>3, '4H'=>4, '5H'=>5, '6H'=>6, '7H'=>7, '8H'=>8, '9H'=>9, '10H'=>10, 'JH'=>10, 'KH'=>10, 'QH'=>10,
#         'AS'=>11, '2S'=> 2, '3S'=>3, '4S'=>4, '5S'=>5, '6S'=>6, '7S'=>7, '8S'=>8, '9S'=>9, '10S'=>10, 'JS'=>10, 'KS'=>10, 'QS'=>10}
#


#dealer_hand = [deckForGame1(0), deckForGame1(2)]
#
player_hand = [deckForGame1(1), deckForGame1(3)]


# Stephen sharing

puts "Hello Player1! Welcome to BlackJack World! Type 'yes' when you are ready to play"
input = gets.chomp
deckforGame1 = deck.shuffle
player1Hand = []
computerHand = []

card1 = deckforGame1.shift
card2 = deckforGame1.shift
card3 = deckforGame1.shift 
card4 = deckforGame1.shift

players_hand_value = 0
computers_hand_value = 0

player1Hand.push(card1, card3)
computerHand.push(card2, card4)

def checkAce(cardsArray)
  flag = false
  aceCount = 0
  cardsArray.each do |card|
    if card.first == 'A'
      flag = true
      aceCount +=1
    end
end

#This method takes a card array and calculates the numeric value of the hand and returns the value
def calculate_valueof_hand(cardsArray)
  hand_value = 0
  cardsArray.each do |card|
    cardValue = card.first.to_i
    if cardValue != 0
      hand_Value += cardValue
    elsif cardValue == 0 && card.first != "A"
        hand_Value += 10
      else
        hand_Value += 11
      end
  end
  doestheHandIncludeAceFlag= false
  if hand_Value > 21 && #does the hand include an ace
    doestheHandIncludeAceFlag = true
    #check for ace and recalculate hand_value
  end
  hand_value
end

players_hand_value = calculate_valueof_hand(player1Hand)
computers_hand_value = calculate_valueof_hand(computerHand)

puts "Hello Player 1. Your hand includes: " + player1Hand.first.first + "of" + player1Hand.first.last +
  "the " + player1Hand[1].first " of " + player1Hand[1].last + ". Computer is showing
" + computerHand.first.first + " of " + computerHand.first.last + ". Would
you like to hit or stay? Please enter 'hit' or 'stand'."
input = gets.chomp

if input.downcase == 'hit'
  card5 = deckforGame1.shift
  player1Hand.push(card5)
  players_hand_value = calculate_valueof_hand(player1Hand)
elsif input.downcase == 'stand'
else
  puts "Please enter hit or stand"
  input = gets.chomp
end