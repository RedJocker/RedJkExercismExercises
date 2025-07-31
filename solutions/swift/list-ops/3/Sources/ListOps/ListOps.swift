func append<T>(_ first: [T], _ second: [T]) -> [T] {
    return switch first.count {
        case 0: second
        default: [first.first!] + append(Array(first.dropFirst()), second) 
    }
}

func concat<T>(_ arr: [T]...) -> [T] {
    return concat(arr)
}

func concat<T>(_ arr: [[T]]) -> [T] {
    return switch arr.count {
    case 0: [T]()
    default: switch arr.first!.count {
             case 0: concat(Array(arr.dropFirst()))
             default: [arr.first!.first!]
                        + concat([Array(arr.first!.dropFirst())] + Array(arr.dropFirst()))
             }
    }
}

func filter<T>(_ arr: [T], _ f: (T) -> Bool) -> [T] {
    return switch arr.count {
        case 0: [T]()
        default: if f(arr.first!) {
                     [arr.first!] + filter(Array(arr.dropFirst()), f)
                 } else {
                     filter(Array(arr.dropFirst()), f)
                 }
    }
}

func length<T>(_ arr: [T]) -> Int {
    return switch arr.count {
        case 0: 0
        default: 1 + length(Array(arr.dropFirst()))
    }
}

func map<T, R>(_ arr: [T], _ f: (T) -> R) -> [R] {
    return switch arr.count {
        case 0: [R]()
        default: [f(arr.first!)] + map(Array(arr.dropFirst()), f) 
    }
}

func foldLeft<T, A>(_ arr: [T], accumulated: A, combine: (A, T) -> A) -> A {
    return switch arr.count {
        case 0: accumulated
        default: foldLeft(Array(arr.dropFirst()),
                          accumulated: combine(accumulated,arr.first!),
                          combine: combine) 
    }
}

func foldRight<T, A>(_ arr: [T], accumulated: A, combine: (T, A) -> A) -> A {
    return switch arr.count {
        case 0: accumulated
        default: combine(arr.first!,
                         foldRight(Array(arr.dropFirst()),
                                   accumulated: accumulated,
                                   combine: combine))
    }
}

private func rev<T>(_ arr: [T], _ acc: [T]) -> [T] {
    return switch arr.count {
        case 0: acc
        default: rev(Array(arr.dropFirst()), [arr.first!] + acc) 
    }
}

func reverse<T>(_ arr: [T]) -> [T] {
    return rev(arr, [T]())
}
