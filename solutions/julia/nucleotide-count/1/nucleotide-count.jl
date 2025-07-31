"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    histogram = Dict(
        'A' => 0, 
        'C' => 0,
        'G' => 0,
        'T' => 0
    )
    for c in strand
        if !haskey(histogram, c)
            throw(DomainError(c, "Invalid char $c"))
        end
        histogram[c] = histogram[c] + 1
    end
    histogram
end
