require 'hand_poker'


describe Hand_Poker do
    # Card types
    let(:card1) { double(:face => 1, :suit => "Spade") }
    let(:card2) { double(:face => 2, :suit => "Club") }
    let(:card3) { double(:face => 3, :suit => "Diamond") }
    let(:card4) { double(:face => 4, :suit => "Heart") }
    let(:card5) { double(:face => 5, :suit => "Club") }
    let(:card6) { double(:face => 6, :suit => "Club") }
    let(:card7) { double(:face => 7, :suit => "Club") }
    let(:card8) { double(:face => 8, :suit => "Club") }
    let(:card9) { double(:face => 9, :suit => "Club") }
    let(:card10) { double(:face => 10, :suit => "Club") }
    let(:card11) { double(:face => "Jack", :suit => "Club") }
    let(:card12) { double(:face => "Queen", :suit => "Club") }
    let(:card13) { double(:face => "King", :suit => "Club") }
    let(:card14) { double(:face => "Ace", :suit => "Club") }
    

    #Hand Types
    let(:high_card) { [card1,card2,card3,card4,card7] }
    let(:pair) { [card1,card1,card3,card4,card6] }
    let(:two_pair) { [card1,card1,card2,card2,card6] }
    let(:three_of_a_kind) { [card6,card6,card6,card4,card5] }
    let(:four_of_a_kind) { [card1,card1,card1,card1,card4] }
    let(:house) { [card1,card1,card1,card2,card2] }
    let(:flush) { [card2,card2,card5,card5,card6] }
    let(:straight) { [card6,card2,card3,card4,card5] }
    let(:sflush) { [card5,card6,card7,card8,card9] }
    let(:rflush) { [card10,card11,card12,card13,card14] }


    #Multiple subjects with multiple hand types
    subject(:test_hand) { Hand_Poker.new(pair) }
    subject(:test_hand_tpair) { Hand_Poker.new(two_pair) }
    subject(:test_hand_high) { Hand_Poker.new(high_card) }
    subject(:test_hand_3) { Hand_Poker.new(three_of_a_kind) }
    subject(:test_hand_4) { Hand_Poker.new(four_of_a_kind) }
    subject(:test_hand_house) { Hand_Poker.new(house) }
    subject(:test_hand_straight) { Hand_Poker.new(straight) }
    subject(:test_hand_flush) { Hand_Poker.new(flush) }
    subject(:test_hand_sflush) { Hand_Poker.new(sflush) }
    subject(:test_hand_rflush) { Hand_Poker.new(rflush) }

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
            expect(test_hand_high.hand_rank).to eq(1)
        end

        it 'checks for hand pairs' do
            expect(test_hand.hand_rank).to eq(2)
            expect(test_hand_tpair.hand_rank).to eq(3)
            expect(test_hand_3.hand_rank).to eq(4)
            expect(test_hand_4.hand_rank).to eq(8)
        end

        it 'checks for full house' do
            expect(test_hand_house.hand_rank).to eq(7)
        end

        it 'checks for straights' do
            expect(test_hand_straight.hand_rank).to eq(5)
            expect(test_hand_sflush.hand_rank).to eq(9)
        end

        it 'checks for flushes' do
            expect(test_hand_flush.hand_rank).to eq(6)
            expect(test_hand_rflush.hand_rank).to eq(10)
        end
    end

end