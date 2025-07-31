let leap_year year =
  let rem_year = Int.rem year
  in
  match () with 
  | _ when rem_year 400 = 0 -> true
  | _ when rem_year 100 = 0 -> false
  | _ -> rem_year 4 = 0
