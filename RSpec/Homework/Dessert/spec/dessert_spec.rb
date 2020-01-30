require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
<<<<<<< HEAD
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type"

    it "sets a quantity"

    it "starts ingredients as an empty array"

    it "raises an argument error when given a non-integer quantity"
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
=======

  let(:chef) { double("chef", name: "Garrett") }
  subject(:dessert) do
    Dessert.new("Brownie", 10, chef)
  end

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to be(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Brownie", "Assload", "Garrett") }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("Nuts")
      expect(dessert.ingredients).to include("Nuts")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to receive(:shuffle!)
      dessert.mix!
    end
  end

  describe "#eat" do

    let(:broke) do
      broke = Dessert.new("Brownie", 2, chef)
    end

    it "subtracts an amount from the quantity" do
      expect(dessert.eat(5)).to be(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do
        broke.eat(5)
      end.to raise_error("not enough left!")
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Garrett the Great Baker")
      
      expect(dessert.serve).to eq("Chef Garrett the Great Baker has made 10 Brownies!")
    end


  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
>>>>>>> dffd6e8116ad2b032e45f63fff0e8616e0614231
  end
end
