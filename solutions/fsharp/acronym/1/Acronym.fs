module Acronym

let regex (pat: string) (str: string) =
    System.Text.RegularExpressions.Regex.IsMatch(str, pat)

let abbreviate (phrase: string) =

    phrase.Split [| ' '; '\t'; '-'; '\n' |]
    |> Seq.map (
        String.filter (fun ch ->
            ch.ToString() |> regex "[A-Za-z]")
    )
    |> Seq.filter (regex "^\s*$" >> not)
    |> Seq.map (fun s -> s[0].ToString().ToUpper())
    |> String.concat ""
