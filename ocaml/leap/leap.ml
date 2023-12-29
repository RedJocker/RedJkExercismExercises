let leap_year year =
  let is_year_div_by x =
    Int.rem year x = 0
  in
  match () with 
  | _ when is_year_div_by 400 -> true
  | _ when is_year_div_by 100 -> false
  | _ -> is_year_div_by 4
