module Hamming

let distance (strand1: string) (strand2: string): int option = 
    if strand1.Length <> strand2.Length then None
    else Some (Seq.fold2 (fun acc ch1 ch2 -> if ch1 <> ch2 then acc + 1 else acc) 0 strand1 strand2)