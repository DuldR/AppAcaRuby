require 'hand_poker'


describe Hand_Poker do
    # Card types
    let(:card1) { double(:face => 1, :suit => "Spade") }
    let(:card2) { double(:face => 2, :suit => "Club") }
    let(:card3) { double(:face => 3, :suit => "Diamond") }
    let(:card4) { double(:face => 4, :suit => "Heart") }
    let(:card5) { double(:face => 5, :suit => "Club") }
    let(:card6) { double(:face => "Jack", :suit => "Club") }

    #Hand Types
    let(:two_of_a_kind) { [card1,card1,card3,card4,card6] }
    let(:three_of_a_kind) { [card6,card6,card6,card4,card5] }
    let(:four_of_a_kind) { [card1,card1,card1,card1,card4] }
    let(:house) { [card1,card1,card1,card2,card2] }
    let(:flush) { [card1,card2,card3,card4,card5] }
    let(:straight) { [card1,card2,card3,card4,card5] }
    let(:sflush) { [card1,card2,card3,card4,card5] }
    let(:rflush) { [card1,card2,card3,card4,card5] }


    #Multiple subjects with multiple hand types
    subject(:test_hand) { Hand_Poker.new(two_of_a_kind) }
    subject(:test_hand_3) { Hand_Poker.new(three_of_a_kind) }
    subject(:test_hand_4) { Hand_Poker.new(four_of_a_kind) }
    subject(:test_hand_house) { Hand_Poker.new(house) }

    describe '#initialize' do
        it 'initial hand must be an array' do
            expect(test_hand.hand).to be_a(Array)
        end

        it 'responds to :face and :suit' do
            expect(test_hand.hand[0].face).to eq(1)
            expect(test_hand.hand[0].suit).to eq("Spade")
        end

        it 'hand size must be 5' do
            expect(test_hand.hand.length).to eq(5)
        end
        
    end

    describe '#hand_rank' do

        it 'checks for hand pairs' do
            expect(test_hand.hand_rank).to eq("2 of a Kind!")
            expect(test_hand_3.hand_rank).to eq("3 of a Kind!")
            expect(test_hand_4.hand_rank).to eq("4 of a Kind!")
        end

        it 'checks for full house' do
            expect(test_hand.hand_rank).to eq("Full House!")
        end

        it 'checks for straights' do
            expect(test_hand_straight.hand_rank).to eq("Straight!")
            expect(test_hand_sflush.hand_rank).to eq("Straight Flush!")
        end

        it 'checks for flushes' do
            expect(test_hand_flush.hand_rank).to eq("Flush!")
            expect(test_hand_rflush.hand_rank).to eq("Royal Flush!")
        end
    end

end