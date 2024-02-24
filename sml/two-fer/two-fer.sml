fun name (input: string option) =
    let
	val name = if input = NONE
		   then "you"
		   else valOf input
    in
	"One for "^name^", one for me."
    end
    
