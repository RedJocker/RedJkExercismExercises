/^[0-9]+$/ {
    if ($0 % 400 == 0)
        print "true"
    else if ($0 % 100 == 0)
        print "false"
    else 
        print $0 % 4 == 0  ? "true" : "false"
}
