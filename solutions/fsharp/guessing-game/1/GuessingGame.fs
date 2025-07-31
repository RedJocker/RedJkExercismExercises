module GuessingGame

let reply (guess: int): string =
    match guess with
        | 42 -> "Correct"
        | g when g > 43 -> "Too high"
        | g when g < 41 -> "Too low"
        | _ -> "So close"
