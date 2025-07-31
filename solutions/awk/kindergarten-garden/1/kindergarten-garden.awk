# These variables are initialized on the command line (using '-v'):
# - name

BEGIN {
    for (i = 0; i < 128; i++) {
	ch = sprintf("%c", i)
	ord[ch] = i
    } 
    offset = (ord[substr(name, 0, 1)] - 65) * 2
    i = 0;
}

function ch_to_plant(ch){
    switch(ch) {
    case "G": return "grass"
    case "C": return "clover"
    case "R": return "radishes"
    case "V": return "violets"
    }
    return ""
}

{
    result[i++] = ch_to_plant(substr($0, offset + 1, 1))
    result[i++] = ch_to_plant(substr($0, offset + 2, 1))
}

END {
    print result[0], result[1], result[2], result[3]
}
