type nucleotide = A | C | G | T

let hamming_distance strand1 strand2 =
  let diff_counter acc n1 n2 = if n1 = n2 then acc else acc + 1
  in
  let strand1_len = List.length strand1
  in
  let strand2_len = List.length strand2
  in
  match (strand1_len, strand2_len) with
  | (0, 0) -> Result.Ok 0
  | (0, _) -> Result.Error "left strand must not be empty"
  | (_, 0) -> Result.Error "right strand must not be empty"
  | (_, _) when strand1_len <> strand2_len -> Result.Error "left and right strands must be of equal length"
  | _ -> Result.Ok (List.fold_left2 diff_counter 0 strand1 strand2)
