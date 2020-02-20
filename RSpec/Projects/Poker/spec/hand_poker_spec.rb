require 'hand_poker'


describe Hand_Poker do
    let (:deck) { ["2 of Spades", "3 of Spades"] }
    subject(:test_hand) { Hand_Poker.new(deck) }

    describe '#initialize' do
        it 'initial hand must be an array' do
            expect(test_hand.hand).to be_a(Array)
        end

        it 'takes in an instance of deck' do
            expect(test_hand.deck).not_to be_empty
        end
        
    end

end