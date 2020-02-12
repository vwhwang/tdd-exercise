# blackjack_score.rb
# hand is a bust (what does a "bust" mean in this scenario?)
# if the hand contains non-cards (what does a "non-card" mean in this scenario?)
# if the hand contains more than five cards

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']



hand = [9,"Ace",2,10]
def blackjack_score(hand)

    if hand.length > 5
        raise ArgumentError.new("#{hand.length} is more than max of 5 cards")
    end 

    score_hand = []
    hand.each do |element|
        if VALID_CARDS.include?(element) == false 
            raise ArgumentError.new("#{element} is a non-valid card")
        end 
        if element == "Jack" || element == "Queen" || element == "King"
            score_hand << 10
        elsif element == "Ace"
            score_hand << 11
        else
            score_hand << element
        end 
    end 

    total_score = score_hand.sum

    if total_score > 21 && hand.include?("Ace")
        total_score -= 10
    end 

    if total_score > 21
        raise ArgumentError.new("#{total_score} is over 21.BUST!")
    end 
    
    return total_score
end 


