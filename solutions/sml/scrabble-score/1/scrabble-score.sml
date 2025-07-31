fun score word =
    let
	fun scoreCh(ch: char) =
	    if Char.contains("AEIOULNRST")(ch) then
		1
	    else if Char.contains("DG")(ch) then
		2
	    else if Char.contains("BCMP")(ch) then
		3
	    else if Char.contains("FHVWY")(ch) then
		4
	    else if Char.contains("K")(ch) then
		5
	    else if Char.contains("JX")(ch) then
		8
	    else if Char.contains("QZ")(ch) then
		10
	    else 
		0
	val wordAsLst = String.explode word
    in
	List.foldl
	    (fn(ch, a) => a + scoreCh(Char.toUpper ch))
	    (0)
	    (wordAsLst)
    end
