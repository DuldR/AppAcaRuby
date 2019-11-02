def neighbor_bombs?(pos)

checkArr= []
colArr = []

colChecks = (pos[1]-1..pos[1]+1).to_a
rowChecks = (pos[0]-1..pos[0]+1).to_a

rowChecks.each.with_index do |row, idx|
    checkArr << [pos[0], rowChecks[idx]]
end

# rowChecks.each.with_index do |row, idx|
#     colChecks.each do |col|
#         checkArr << [colChecks[idx], rowChecks[idx]]
#     end
# end

print rowChecks
print "Row Checks"
print checkArr[0..2]

print "Col checks"
print checkArr[3..5]



end

butts = [1,1]

neighbor_bombs?(butts)