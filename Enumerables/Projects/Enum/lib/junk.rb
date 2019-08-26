def say_hi(spc = "")
    returnStr = ""

    self.each do |ele|
        returnStr += (ele + spc)
    end

    returnStr

end

# "howdy".say_hi("nani?!")

# def add(arr)
#     inB = ""

#     arr.each do |ele|
#         inB += ele
#     end

#     inB
# end

# butts = ["a", "b", "c"]
# p add(butts)