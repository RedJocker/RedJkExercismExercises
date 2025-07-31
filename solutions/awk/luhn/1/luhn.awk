{
    gsub(/\s+/, "")
    len = length($0)
    acc = 0
    target_mod = len % 2 == 0 
    for (i = len; i > 0; i--) {
	digit = substr($0, i, 1)
	if (i % 2 == target_mod) {
	    digit = digit * 2
	}
	if (digit > 9) {
	    digit = digit - 9
	}
	acc = acc + digit
    }
    is_valid = len > 1 && $0 ~ /^[0-9]+$/ && acc % 10 == 0 
    print is_valid ? "true" : "false"
}
