proc reverse*(a: string): string =
  var s = a
  let middle = s.len div 2
  for i in s.low ..< middle:
    let temp = s[i]
    s[i] = s[^(i + 1)]
    s[^(i + 1)] = temp
  return s
