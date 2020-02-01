require "project1"

describe "Part 1:" do
    describe "my_uniq" do
        it "raise an error if not an array" do
            expect { my_uniq("Hello") }.to raise_error(ArgumentError)
        end

        it "must not return duplicates" do
            expect(my_uniq([1, 1])).to eq([1])
        end

        it "must return in order found" do
            expect(my_uniq([2, 1, 3, 2])).to eq([2, 1,3])
        end
    end


    describe "my_transpose" do
        it "raise an error if not an array" do
            expect {my_transpose("Hello") }.to raise_error(ArgumentError)
        end

        it "return array must be the length of the input array" do
            expect(my_transpose([[1,2],[2,1]]).length).to eq(2)
        end

        it "col1 should be equal to row1" do
            expect(my_transpose([[1,2],[3,4]])[0][0]).to eq(1)
            expect(my_transpose([[1,2],[3,4]])[1][0]).to eq(2)
        end

        it "row1 should be equal to col1" do
            expect(my_transpose([[1,2,3],[4,5,6],[7,8,9]])[0][0]).to eq(1)
            expect(my_transpose([[1,2,3],[4,5,6],[7,8,9]])[0][1]).to eq(4)
            expect(my_transpose([[1,2,3],[4,5,6],[7,8,9]])[0][2]).to eq(7)
        end

    end        
end

#### EXAMPLES

# it "should return the average of the two numbers" do
#     expect(average(4, 8)).to eq(6)
#     expect(average(5, 10)).to eq(7.5)

###########