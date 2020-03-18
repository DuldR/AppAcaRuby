require "game"

describe Game do

    let(:player1) { double(:player_hand => 1, :pot => 40) }
    let(:player2) { double(:player_hand => 2, :pot => 20) }


    subject(:game) { Game.new }


    describe '#initialize' do

        it 'sets a global deck' do
            expect(game.deck).not_to be_empty
        end

        it 'total pot must be 0' do
            expect(game.total_pot).to eq(0)
        end

        it 'sets a two players' do
            expect(game.player1).not_to be_empty
            expect(game.player2).not_to be_empty
        end

    end

    describe '#turn' do
    
    end

    describe '#bigpot' do

    end

    describe '#win?' do
    
    end

    describe '#lose?' do

    end

    describe 'gameover?' do

    end










end