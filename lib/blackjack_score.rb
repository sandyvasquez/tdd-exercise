# blackjack_score.rb
VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
		hand_value = 0
		ace_value = 0
		ace_counter = 0

		if hand_value >= 11 && hand.include?('Ace')
			ace_value = 1
		end

		if hand_value < 11 && hand.include?('Ace')
			ace_value = 11
		end

		if hand_value > 21
			raise ArgumentError.new("Bust!")
		end
		# hand is an array of cards
		hand.each do |num|
			if num == 'Jack' || num == 'Queen'|| num == 'King'
				num = 10
			end

			hand_value += num.to_i

			if num == 'Ace'
				ace_counter +=1
			end
		end

		ace_counter.times do |num|
			if num == ace_counter - 1
				# this block deals with the last 'ace'
				##Terniary example: hand_value += (hand_value <= 10) ? 11 : 1
				if hand_value <= 10
					hand_value +=11
				else
					hand_value +=1
				end
			else
				hand_value +=1
				# these are all of the non last 'ace' values
			end
		end

		return hand_value
	end
