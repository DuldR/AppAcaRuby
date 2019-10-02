
#Recursive Range

def range(nS, nE)

    if nS == nE
        return []
    elsif nE < nS
        return []
    end

    [nS] + range(nS + 1, nE)

end

#Iterative Range

def irange(nS, nE)

    retArr = []

    if nE < nS
        return []
    else
        while nS < nE
            retArr << nS
            nS += 1
        end
    end

    return retArr
end

#Recursion 1
def exp(base, ex)

    return 1 if ex == 0

    base * exp(base, ex - 1)
end

def exp2(base, ex)

    if ex == 2
        return base * 2
    elsif ex == 1
        return base
    end

    if ex.odd?
        base * exp2(base, (ex - 1) / 2) * exp2(base, (ex - 1) / 2)
    else
        exp2(base, (ex / 2)) * exp2(base, (ex / 2))
    end

end
