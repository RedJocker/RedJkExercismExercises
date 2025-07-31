module Acronym

let regex (pat: string) (str: string) =
    System.Text.RegularExpressions.Regex.IsMatch(str, pat)

let abbreviate (phrase: string) =

    phrase.Split [| ' '; '\t'; '-'; '\n' |]
    |> Seq.map (String.filter (string >> regex "[A-Za-z]"))
    |> Seq.filter (regex "^\s*$" >> not)
    |> Seq.map (Seq.head >> System.Char.ToUpper >> string)
    |> String.concat ""
