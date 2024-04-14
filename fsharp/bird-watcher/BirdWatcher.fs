module BirdWatcher

let lastWeek: int[] = [| 0; 2; 5; 3; 7; 8; 4 |]

let yesterday (counts: int[]) : int = counts[5]

let total (counts: int[]) : int = Array.fold (+) 0 counts

let dayWithoutBirds (counts: int[]) : bool = Array.contains 0 counts

let incrementTodaysCount (counts: int[]) : int[] =
    match counts with
    | [| a; b; c; d; e; f; g |] -> [| a; b; c; d; e; f; g + 1 |]
    | _ -> counts

let unusualWeek (counts: int[]) : bool =
    match counts with
    | [| a; b; c; d; e; f; g |] when b = 0 && d = 0 && f = 0 -> true
    | [| a; b; c; d; e; f; g |] when b = 10 && d = 10 && f = 10 -> true
    | [| a; b; c; d; e; f; g |] when a = 5 && c = 5 && e = 5 -> true
    | _ -> false
