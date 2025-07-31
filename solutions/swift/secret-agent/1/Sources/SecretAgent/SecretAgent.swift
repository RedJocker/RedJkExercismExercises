func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
    func makeSecret(pass: String) -> String {
        if pass == password {
            return secret                    
        } else {
            return "Sorry. No hidden secrets here."
        }
    }
    return makeSecret
}

func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
  return (f(room), f(f(room)), f(f(f(room))))
}
