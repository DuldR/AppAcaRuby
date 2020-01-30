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
end

#### EXAMPLES

# it "should return the average of the two numbers" do
#     expect(average(4, 8)).to eq(6)
#     expect(average(5, 10)).to eq(7.5)

###########