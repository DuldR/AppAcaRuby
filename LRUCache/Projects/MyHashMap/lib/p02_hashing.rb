class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    fixnum = self.join.to_i
    fixnum ^ 2
  end
end

class String
  def hash
    fixnum = self.chars.map { |x| x.ord }
    fixnum.join.to_i ^ 2
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    fixnum = []
    self.each do |k, v|
      fixnum << k.to_s
      fixnum << v
    end

    fixnum = fixnum.map { |x| x.ord }
    fixnum.sort!
    fixnum.join.to_i ^ 2
  end
end
