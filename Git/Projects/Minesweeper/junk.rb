def neighbor_bombs?(pos)

checkArr= []
colArr = []

rowChecks = (pos[1]-1..pos[1]+1).to_a
colChecks = (pos[0]-1..pos[0]+1).to_a

rowChecks.each.with_index do |row, idx|
    checkArr << [pos[0], rowChecks[idx]]
end

rowChecks.each.with_index do |row, idx|
    checkArr << [colChecks[idx], pos[1],]
end

print "Print rowChecks"
print rowChecks
print "Row Checks"
print checkArr[0..2]

print "Col checks"
print checkArr[3..5]



end

butts = [3,4]

neighbor_bombs?(butts)