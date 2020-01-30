require 'rspec'
require 'project1.rb'


# EXAMPLE

  
# require "part_1"

# describe "Part 1:" do
#   describe "average" do
#     it "should accept two numbers as arguments" do
#       expect { average(4, 8) }.to_not raise_error
#     end

#     it "should return the average of the two numbers" do
#       expect(average(4, 8)).to eq(6)
#       expect(average(5, 10)).to eq(7.5)
#     end
#   end

describe "Uniq:" do
    describe "my_uniq" do
        it "should accept an array as an argument" do
            expect { my_uniq([1,2]).to_not raise_error }
        end
    end
end