pub fn new_list() -> List(String) {
    []
}

pub fn existing_list() -> List(String) {
    ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

pub fn count_languages(languages: List(String)) -> Int {
    case languages {
    	 [] -> 0
	 [_, ..rest] -> 1 + count_languages(rest)
    }
}

fn rev(l, acc) {
    case l {
    	 [] -> acc
	 [h, ..t] -> rev(t, [h, ..acc])
    }
}

pub fn reverse_list(languages: List(String)) -> List(String) {
    rev(languages, [])
}

pub fn exciting_list(languages: List(String)) -> Bool {
    case languages {
    	 [_, "Gleam"] -> True 
    	 [_, "Gleam", _] -> True
	 ["Gleam", .._] -> True
	 _ -> False
    }
}
