pub fn reply(guess: Int) -> String {
  case guess - 42 {
       0 -> "Correct"
       i if i > 1 -> "Too high"
       i if i < -1 -> "Too low"
       _ -> "So close" 
  }
}
