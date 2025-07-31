
fun plants (diagram: string) (student: string): string list =
    let
	val lines = String.tokens (fn ch => ch = #"\n") diagram
	val index = ~65 + (Char.ord o String.sub) (student, 0)
	val plantLines =
	    List.map
		(fn s => String.substring (s, index * 2, 2))
		lines
	val plantsInitials = String.concat plantLines
	exception PlantNotFound of char
	val plants = List.map
			 (fn #"V" => "violets"
			 | #"C" => "clover"
			 | #"R" => "radishes"
			 | #"G" => "grass"
			 | ch => raise PlantNotFound ch)
			 (String.explode plantsInitials)
    in
	plants
    end
