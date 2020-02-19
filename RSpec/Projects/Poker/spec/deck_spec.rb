require 'deck'

describe Deck do
    subject(:deck) { Deck.new }
    let(:card) { double("Card") }
    

    describe '#initialize' do
        it 'sets opening set as empty array' do
            expect(deck.set).to be_empty
            expect(deck.deck).to be_empty
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

        before(:each) do
            deck.create_set
            deck.format_deck
        end

        it 'should include all of the cards in a deck' do
            expect(deck.deck).to include("Ace of Spades")
            expect(deck.deck).to include("4 of Hearts")
            expect(deck.deck).to include("Jack of Clubs")
        end

        it 'should not include duplicates' do
            expect(deck.deck.count("2 of Spades")).to eq(1)
            expect(deck.deck.count("Jack of Hearts")).to eq(1)
        end

    end



end