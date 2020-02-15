require 'card'

describe Card do
    subject(:card) { Card.new("4", "Spade") }

    describe '#initialize' do
        it 'must set a suit' do
            expect(card.suit).to eq("Spade")
        end

        it 'must set a face' do
            expect(card.face).to eq("4")
        end

        it "when suit or face is not valid" do
            expect{ Card.new("4", "what") }.to raise_error("That's not a suit")
            expect{ Card.new("hello", "Spade") }.to raise_error("That's not a face")
        end


    end

    describe 'val?' do
        it 'must return the face and suit' do
            expect(card.val?).to eq("4 of Spades")
        end
    end


end