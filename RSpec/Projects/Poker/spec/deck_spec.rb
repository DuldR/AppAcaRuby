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

        it 'should include card objects' do
            allow(card).to receive(:initialize).and_return("Card")
            expect(deck.create_set).to include("Card")
        end


    end


end