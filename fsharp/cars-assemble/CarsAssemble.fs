module CarsAssemble

let successRate (speed: int): float =
    match speed with
        | s when s = 0 -> 0.0
        | s when s <= 4 -> 1.0
        | s when s <= 8 -> 0.9
        | s when s <= 9 -> 0.8
        | s when s <= 10 -> 0.77
        | _ -> failwithf "invalid speed %d" speed

let baseProduction = 221 

let productionRatePerHour (speed: int): float =
    float(baseProduction * speed) * (successRate speed)

let workingItemsPerMinute (speed: int): int =
    int ((productionRatePerHour speed) / 60.0)
