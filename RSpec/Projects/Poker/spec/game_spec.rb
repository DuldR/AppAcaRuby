require "game"

describe Game do

    let(:player1) { double(:player_hand => 1, :pot => 40) }
    let(:player2) { double(:player_hand => 2, :pot => 20) }


    subject(:game) { Game.new }


    describe '#initialize' do

        it 'total pot must be 0' do
            expect(game.total_pot).to eq(0)
        end

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