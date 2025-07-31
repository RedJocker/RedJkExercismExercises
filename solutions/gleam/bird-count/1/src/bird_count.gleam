import gleam/int
import gleam/list

pub fn today(days: List(Int)) -> Int {
    case days {
        [] -> 0
	[d, ..] -> d
    }
    
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
    case days {
        [] -> [1]
	[d, ..ds] -> [d + 1, ..ds]
    }
  
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
    case days {
        [] -> False
	[0, ..] -> True
	[_, ..ds] -> has_day_without_birds(ds)
    }
}

pub fn total(days: List(Int)) -> Int {
    int.sum(days)  
}

pub fn busy_days(days: List(Int)) -> Int {
    days
    |> list.filter(fn(x) {x >= 5})
    |> list.length
}
