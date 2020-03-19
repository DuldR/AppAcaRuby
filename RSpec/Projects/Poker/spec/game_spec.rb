require "game"

describe Game do

    let(:player1) { double(:player_hand => 1, :pot => 40) }
    let(:player2) { double(:player_hand => 2, :pot => 20) }
    let(:player3) { double(:player_hand => 2, :pot => 0) }


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
    
        it 'if players pot is empty, they lose' do
            expect(game.lose?(player3)).to be true
        end

    end

    describe 'gameover?' do

    end










end