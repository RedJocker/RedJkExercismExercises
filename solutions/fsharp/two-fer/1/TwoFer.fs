module TwoFer

let twoFer (maybeName: string option): string = 
    match maybeName with
    | None -> "One for you, one for me."
    | Some name -> sprintf "One for %s, one for me" name