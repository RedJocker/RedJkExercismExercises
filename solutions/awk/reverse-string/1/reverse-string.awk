BEGIN {
    FS = ""
}

{
    for (i = 1; $i != ""; i++) {
	acc = $i acc
    }
}

END {
    print acc
}
