let empty = Base.Map.empty (module Base.Char)

let validate_nucleotide n = match n with
  | 'A' | 'C' | 'G' | 'T' -> Result.Ok n
  | _ -> Result.Error n


let count_nucleotide s n =
  let valid_n = validate_nucleotide n
  in
  let initial_value = Result.bind valid_n (fun _ -> Result.Ok 0)
  in
  let counter acc cur =
    let valid_cur = validate_nucleotide cur in
    Result.bind valid_n (fun target_nucleotide ->
        Result.bind valid_cur (fun current_nucleotide ->
            if target_nucleotide = current_nucleotide then
              Result.map ((+) 1) acc
            else
              acc))     
  in
  String.fold_left counter initial_value s

let count_nucleotides strand =
  let inc_map_value = function
    | Some value -> value + 1
    | None -> 1
  in
  let counter acc cur =
    let valid_cur = validate_nucleotide cur
    in
    Result.bind acc (fun histogram_map ->
        Result.map
          (fun current_nucleotide ->
            Base.Map.update histogram_map current_nucleotide ~f:inc_map_value)
          valid_cur)
  in
  String.fold_left counter (Result.Ok empty) strand


