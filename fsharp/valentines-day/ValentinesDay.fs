module ValentinesDay

type Approval =
    | Yes | No | Maybe

type Cuisine =
    | Korean | Turkish

type Genre =
    | Crime
    | Horror
    | Romance
    | Thriller

type Activity =
    | BoardGame
    | Chill
    | Movie of Genre
    | Restaurant of Cuisine
    | Walk of int

let rateActivity (activity: Activity): Approval =
    match activity with
        | Movie Romance
        | Restaurant Korean -> Yes
        | Walk distance when distance < 3 -> Yes 
        | Restaurant Turkish -> Maybe
        | Walk distance when distance < 5 -> Maybe
        | _ -> No
