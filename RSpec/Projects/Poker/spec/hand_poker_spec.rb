require 'hand_poker'


describe Hand_Poker do
    let(:card1) { double(:face => 2, :suit => "Spade") }
    let(:card2) { double(:face => 3, :suit => "Spade") }
    let(:card3) { double(:face => 2, :suit => "Heart") }
    let(:card4) { double(:face => 4, :suit => "Spade") }
    let(:card5) { double(:face => 2, :suit => "club") }
    let(:dealt) { [card1,card2,card3,card4,card5] }

    subject(:test_hand) { Hand_Poker.new(dealt) }

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

end