module TwoFer

open Core.Option  

let twoFer (maybeName: string option): string = 
    defaultValue "you" maybeName
    |> sprintf "One for %s, one for me."
    