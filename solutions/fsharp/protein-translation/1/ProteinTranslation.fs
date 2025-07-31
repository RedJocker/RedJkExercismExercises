module ProteinTranslation

let (|Prefix|_|) (pattern: string) (str: string) =
    if str.StartsWith(pattern) then
        let tail = str.Substring(pattern.Length)
        Some(tail)
    else
        None

let proteins rna =
    let rec matcher str acc =
        match str with
        | Prefix "AUG" tail -> matcher tail ("Methionine" :: acc)
        | Prefix "UUU" tail -> matcher tail ("Phenylalanine" :: acc)
        | Prefix "UUC" tail -> matcher tail ("Phenylalanine" :: acc)
        | Prefix "UUA" tail -> matcher tail ("Leucine" :: acc)
        | Prefix "UUG" tail -> matcher tail ("Leucine" :: acc)
        | Prefix "UCU" tail -> matcher tail ("Serine" :: acc)
        | Prefix "UCC" tail -> matcher tail ("Serine" :: acc)
        | Prefix "UCA" tail -> matcher tail ("Serine" :: acc)
        | Prefix "UCG" tail -> matcher tail ("Serine" :: acc)
        | Prefix "UAU" tail -> matcher tail ("Tyrosine" :: acc)
        | Prefix "UAC" tail -> matcher tail ("Tyrosine" :: acc)
        | Prefix "UGU" tail -> matcher tail ("Cysteine" :: acc)
        | Prefix "UGC" tail -> matcher tail ("Cysteine" :: acc)
        | Prefix "UGG" tail -> matcher tail ("Tryptophan" :: acc)
        | _ -> acc

    matcher rna [] |> List.rev
