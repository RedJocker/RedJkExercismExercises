BEGIN {
	FS = ""
	rna_complement = ""
	error = ""
	complement_table["G"] = "C"
	complement_table["C"] = "G"
	complement_table["T"] = "A"
	complement_table["A"] = "U"
}

{
	for (i = 1; i <= NF; i++) {
		nucleotide_complement = complement_table[$i]
		if (!nucleotide_complement){
			error = "Invalid nucleotide detected."
			exit 1
		} else {
			rna_complement = rna_complement nucleotide_complement
		}
	}
}

END {
	if (error)
		print error
	else
		print rna_complement
}
