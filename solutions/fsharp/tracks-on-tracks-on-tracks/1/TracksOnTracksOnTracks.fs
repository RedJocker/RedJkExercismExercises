module TracksOnTracksOnTracks

let newList: string list = []

let existingList: string list = [ "F#"; "Clojure"; "Haskell" ]

let addLanguage
    (language: string)
    (languages: string list)
    : string list =
    language :: languages

let countLanguages (languages: string list) : int = languages.Length

let reverseList (languages: string list) : string list =
    let rec revHelper lgs acc =
        match lgs with
        | [] -> acc
        | hd :: tl -> revHelper tl (hd :: acc)

    revHelper languages []

let excitingList (languages: string list) : bool =
    match languages with
    | "F#" :: _ -> true
    | [ _; "F#" ] -> true
    | [ _; "F#"; _ ] -> true
    | _ -> false
