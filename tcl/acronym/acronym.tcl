proc abbreviate {phrase} {
    set words [split $phrase " -_"]
    set words_len [llength $words]
    for {set i 0} {$i < $words_len} {incr i} {
	lset words $i [string index [lindex $words $i] 0]  
    }
    return [string toupper [join $words ""]]
}
