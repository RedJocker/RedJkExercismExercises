module Acronym

let regex (pat: string) (str: string) =
    System.Text.RegularExpressions.Regex.IsMatch(str, pat)

let abbreviate (phrase: string) =

    phrase.Split [| ' '; '\t'; '-'; '\n' |]
    |> Seq.map (String.filter System.Char.IsLetter)
    |> Seq.filter (regex "^\S")
    |> Seq.map (Seq.head >> System.Char.ToUpper >> string)
    |> String.concat ""
