BEGIN {
    name = "you"
}

{
    name = $0 == "" ? name : $0
}

END {
    print "One for "name", one for me."
    exit 0
}
