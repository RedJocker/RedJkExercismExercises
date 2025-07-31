pub fn append(first first: List(a), second second: List(a)) -> List(a) {
    case first {
        [] -> second
	[f, ..fs] -> [f, ..append(fs, second)]
    }
}

pub fn concat(lists: List(List(a))) -> List(a) {
    case lists {
        [] -> []
	[[]] -> []
	[[], ..ls] -> concat(ls)
	[[x, ..xs], ..ls] -> [x, ..concat([xs, ..ls])]
    }	
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
    case list {
        [] -> []
	[x, ..xs] -> case function(x) {
	    True -> [x, ..filter(xs, function)]
	    False -> filter(xs, function)
	}
    }
}

pub fn length(list: List(a)) -> Int {
    case list {
        [] -> 0
	[_, ..ls] -> 1 + length(ls)
    }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
    case list {
        [] -> []
	[hd, ..tail] -> [function(hd), ..map(tail, function)]
    }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
    case list {
        [] -> initial
	[hd, ..tail] -> foldl(tail, function(initial, hd), function)
    }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
    case list {
        [] -> initial
	[hd, ..tail] -> function(foldr(tail, initial, function), hd) 
    }
}

fn rev(ls, acc){
    case ls {
        [] -> acc
	[hd, ..tail] -> rev(tail, [hd, ..acc])
    }
}

pub fn reverse(list: List(a)) -> List(a) {
    rev(list, [])
}
