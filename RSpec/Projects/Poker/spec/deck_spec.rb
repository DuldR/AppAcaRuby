require 'deck'

describe Deck do
    subject(:deck) { Deck.new }
    let(:card) { double("Card") }
    

    describe '#initialize' do
        it 'sets opening deck as empty array' do
            expect(deck.set).to be_empty
        end
    end

    describe '#create_set' do
        

        it 'should not be an empty array' do
            expect(deck.create_set).not_to be_empty
        end

        it 'should be 52 cards' do
            expect(deck.create_set.length).to eq(52)
        end

    end

    describe '#format_deck' do


        it 'should include all of the cards in a deck' do
            expect(deck.format_deck.include?("Ace of Spades")
        end
    end



end