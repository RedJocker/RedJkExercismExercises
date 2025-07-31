fun concat ([]) = []
  | concat ([]::xxs) = concat(xxs)
  | concat ((x::xs)::xss) = x :: concat(xs::xss)

fun reverse (list) =
    let
	fun rev([], acc) = acc
	  | rev ((x::xs), acc) = rev(xs, (x::acc))
    in
	rev(list, [])
    end

fun filter (_, []) = []
  | filter (f, (x::xs)) = if f x then x :: (filter (f,xs)) else filter (f,xs)

fun map (_, []) = []
  | map (f, (x::xs)) = (f x) :: map(f, xs)

fun append ([], list2)= list2
  | append ((x::xs), list2) = x :: append(xs, list2)

fun length ([]): int = 0
  | length (x::xs) = 1 + length(xs)

fun foldl (_, initial, []) = initial
  | foldl (f, initial, (x::xs)) = foldl(f, (f (initial, x)), xs)

fun foldr (_, initial, []) = initial
  | foldr (f, initial, (x::xs)) = f (x, foldr(f, initial, xs))
