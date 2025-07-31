					 
fun isPangram s =
    let
	val lowerS = String.explode(String.map Char.toLower s)
	val alpha = String.explode "abcdefghijklmnopqrstuwxyz"
	fun removeCh ch [] = []
	  | removeCh ch (s::ss)  = if (not o Char.isAlpha) ch then
				       s::ss
				   else if ch = s then
				       ss
				   else
				       s::(removeCh ch ss)

	fun pangram _ [] = true 
	  | pangram [] (_::_) = false
	  | pangram (ch::chs) ss = pangram chs (removeCh ch ss)
    in
	pangram lowerS alpha
    end
