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
        
        it 'cannot be an empty array' do
            expect(deck.create_set).not_to be_empty
        end

        it 'must be 52 cards' do
            expect(deck.create_set.length).to eq(52)
        end

    end

    describe '#format_deck' do

        before(:each) do
            deck.create_set
            deck.format_deck
        end

        it 'must include all of the cards in a deck' do
            expect(deck.deck).to include("Ace of Spades")
            expect(deck.deck).to include("4 of Hearts")
            expect(deck.deck).to include("Jack of Clubs")
        end

        it 'must not include duplicates' do
            expect(deck.deck.count("2 of Spades")).to eq(1)
            expect(deck.deck.count("Jack of Hearts")).to eq(1)
        end

    end

    describe '#deal' do
        before(:each) do
            deck.ready?
        end

        it 'must return the amount requested' do 
            expect(deck.deal(2).length).to eq(2)
        end

        it 'must reduce the deck by the amount requested' do
            deck.deal(2)
            expect(deck.set.length).to eq(50)
        end
        

    end



end