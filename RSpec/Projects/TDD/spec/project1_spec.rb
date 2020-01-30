require "project1"

describe "Part 1:" do
    describe "my_uniq" do
        it "raise an error if not an array" do
        expect { my_uniq("Hello") }.to raise_error(ArgumentError)
        end
    end
end
