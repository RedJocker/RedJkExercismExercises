fun collatz n =
    let
	fun count num x =
	    if num = 1 then
		x
	    else if num mod 2 = 0 then
		count (num div 2) (x + 1)
	    else
		count (num * 3 + 1) (x + 1)
    in
	if n <= 0 then
	    NONE
	else
	    SOME (count n 0)
    end

