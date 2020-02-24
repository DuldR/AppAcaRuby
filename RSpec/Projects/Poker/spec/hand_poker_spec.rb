require 'hand_poker'


describe Hand_Poker do
    # Card types
    let(:card1) { double(:face => 2, :suit => "Spade") }
    let(:card2) { double(:face => 3, :suit => "Spade") }
    let(:card3) { double(:face => 2, :suit => "Heart") }
    let(:card4) { double(:face => 4, :suit => "Spade") }
    let(:card5) { double(:face => 2, :suit => "Club") }
    let(:card6) { double(:face => "Jack", :suit => "Club") }

    #Hand Types
    let(:dealt) { [card1,card2,card3,card4,card5] }
    let(:two_of_a_kind) { [card1,card6,card6,card2s,card5] }
    let(:three_of_a_kind) { [card1,card1,card1,card4,card4] }
    let(:four_of_a_kind) { [card1,card1,card1,card1,card4] }

    subject(:test_hand) { Hand_Poker.new(four_of_a_kind) }
    subject(:test_hand_3) { Hand_Poker.new(dealt) }

    describe '#initialize' do
        it 'initial hand must be an array' do
            expect(test_hand.hand).to be_a(Array)
        end

        it 'responds to :face and :suit' do
            expect(test_hand.hand[0].face).to eq(2)
            expect(test_hand.hand[0].suit).to eq("Spade")
        end

        it 'hand size must be 5' do
            expect(test_hand.hand.length).to eq(5)
        end
        
    end

    describe '#hand_rank' do

        it 'checks for hand combinations' do
            # subject(:test_hand_3) { Hand_Poker.new(three_of_a_kind) }
            expect(test_hand_3.hand_rank).to eq("3 of a Kind!")
        end
    end

end