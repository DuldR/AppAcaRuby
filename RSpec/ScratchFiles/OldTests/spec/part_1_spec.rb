require "part_1"

describe "Part 1:" do
  describe "my_uniq" do
    it "should raise an error if not an array" do
      expect { my_uniq(4, 8) }.to raise_error(ArgumentError)
    end

  end

end