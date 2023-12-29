let raindrop num =
  let mk_sound sound base = if Base.(num % base) = 0 then sound else "" in
  let pling = mk_sound "Pling" 3 in
  let plang = mk_sound "Plang" 5 in
  let plong = mk_sound "Plong" 7 in
  let rain_sound = String.concat "" [pling; plang; plong] in
  if rain_sound = "" then string_of_int num else rain_sound
  
    
