fun isValid (isbn: string): bool =
    let
	fun chToInt ch = (Char.ord ch) - (Char.ord #"0")
	fun checkIsbn [] 0 acc = (acc mod 11) = 0
	  | checkIsbn [] _ _ = false
	  | checkIsbn _ 0 _  = false
	  | checkIsbn (#"X"::[]) 1 acc = checkIsbn [] 0 (acc + 10)
	  | checkIsbn (d::ds) num acc =
	    if Char.isDigit d
	    then checkIsbn ds (num - 1) (acc + (num * chToInt d))
	    else if d = #"-" then checkIsbn ds num acc
	    else false
    in
	checkIsbn (String.explode isbn) 10 0
    end
