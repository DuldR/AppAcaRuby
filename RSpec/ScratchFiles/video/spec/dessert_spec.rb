require 'dessert'

describe Dessert do

    subject(:brownie) { Dessert.new("brownie", 50) }
    
    describe '#initialize' do
        it 'takis in a type' do
            expect(brownie.type).to eq('brownie')
        end

        it 'takes in an amount' do
            expect(brownie.amount).to eq(50)
        end

        context 'with a huge amount' do
            subject(:brownie) { Dessert.new("brownie", 10000)}
            it 'sets the type' do
                expect(brownie.type).to eq('giant brownie')
            end
        end

    end
end