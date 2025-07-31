namespace eval resistorColor {
    variable colors
    array set colors {
	    black 0
	    brown 1
	    red 2
	    orange 3
	    yellow 4
	    green 5
	    blue 6
	    violet 7
	    grey 8
	    white 9
    }

    proc colorCode {args} {
	variable colors
	if {[info exists colors($args)]} {
	    return $colors($args)
	} else {
	    error "Invalid color: $args"
	}
    }

    proc sorter {a b} {
        variable colors
        expr {$colors($a) - $colors($b)}
    }

    proc colors {} {
        variable colors
	return [lsort -command sorter [array names colors]]
    }
}
