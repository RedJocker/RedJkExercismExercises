func append<T>(_ first: [T], _ second: [T]) -> [T] {
    switch first.count {
        case 0: return second
        default: return [first.first!] + append(Array(first.dropFirst()), second) 
    }
}

func concat<T>(_ arr: [T]...) -> [T] {
    return concat(arr)
}

func concat<T>(_ arr: [[T]]) -> [T] {
    switch arr.count {
    case 0: return [T]()
    default: switch arr.first!.count {
             case 0: return concat(Array(arr.dropFirst()))
             default: return [arr.first!.first!]
                        + concat([Array(arr.first!.dropFirst())] + Array(arr.dropFirst()))
             }
    }
}

func filter<T>(_ arr: [T], _ f: (T) -> Bool) -> [T] {
    switch arr.count {
        case 0: return [T]()
        default: if f(arr.first!) {
                     return [arr.first!] + filter(Array(arr.dropFirst()), f)
                 } else {
                     return filter(Array(arr.dropFirst()), f)
                 }
    }
}

func length<T>(_ arr: [T]) -> Int {
    switch arr.count {
        case 0: return 0
        default: return 1 + length(Array(arr.dropFirst()))
    }
}

func map<T, R>(_ arr: [T], _ f: (T) -> R) -> [R] {
    switch arr.count {
        case 0: return [R]()
        default: return [f(arr.first!)] + map(Array(arr.dropFirst()), f) 
    }
}

func foldLeft<T, A>(_ arr: [T], accumulated: A, combine: (A, T) -> A) -> A {
    switch arr.count {
        case 0: return accumulated
        default: return foldLeft(Array(arr.dropFirst()),
                          accumulated: combine(accumulated,arr.first!),
                          combine: combine) 
    }
}

func foldRight<T, A>(_ arr: [T], accumulated: A, combine: (T, A) -> A) -> A {
    switch arr.count {
        case 0: return accumulated
        default: return combine(arr.first!,
                         foldRight(Array(arr.dropFirst()),
                                   accumulated: accumulated,
                                   combine: combine))
    }
}

private func rev<T>(_ arr: [T], _ acc: [T]) -> [T] {
    switch arr.count {
        case 0: return acc
        default: return rev(Array(arr.dropFirst()), [arr.first!] + acc) 
    }
}

func reverse<T>(_ arr: [T]) -> [T] {
    return rev(arr, [T]())
}
