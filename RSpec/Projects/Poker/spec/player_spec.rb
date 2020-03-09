require "player"

describe Player do

    #Card setup
    let(:card1) { double(:face => 2, :suit => "Diamond") }
    let(:card2) { double(:face => 3, :suit => "Heart") }
    let(:card3) { double(:face => 4, :suit => "Spade") }
    let(:card4) { double(:face => 5, :suit => "Club") }
    let(:card5) { double(:face => 6, :suit => "Club") }

    #Hand setup
    let(:test_hand) { [card1,card2,card3,card4,card5] }

    subject(:player) {Player.new(test_hand)}


    describe "#initialize" do
        it 'set hand to a hand_poker object' do
            expect(player.player_hand).not_to be_empty
        end
        
        it 'set initial pot to 20 dollars' do
            expect(player.pot).to eq(20)
        end

    end

    describe '#discard?' do

        it 'raises an error if user input is incorrect' do
            expect{ player.discard("howdy") }.to raise_error("Not a valid input.")
            expect{ player.discard([1,2,3,4,5,6]) }.to raise_error("Not a valid input.")
        end

        it 'takes in user input and discards that many cards' do
            player.discard([1,2,3])
            expect(player.player_hand.length).to eq(2)
        end

    end

end