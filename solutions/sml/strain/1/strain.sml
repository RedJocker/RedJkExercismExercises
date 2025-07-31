fun keep _ [] = []
  | keep f (x::xs) =
    if f (x) then x :: keep f xs else keep f  xs 

fun discard _ [] = []
  | discard f (x::xs) =
    if f (x) then discard f xs else x :: discard f  xs
