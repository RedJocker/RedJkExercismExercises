can_chain([(A,A)]).
can_chain(Pieces) :- 
    empty_assoc(EmptyMap),
    foldl(piece_count, Pieces, (EmptyMap, EmptyMap), (ResultSingleMap, ResultDoubleMap)),
    assoc_to_values(ResultSingleMap, SingleValues),
    exclude(even, SingleValues, SingleValuesNoEven),
    SingleValuesNoEven = [],
    assoc_to_keys(ResultDoubleMap, DoubleKeys),
    maplist({ResultSingleMap}/[K, R] >> (get_assoc(K, ResultSingleMap, R)), DoubleKeys, _).

get_assoc_or_default(Key, Map, Default, Return) :-
    get_assoc(Key, Map, Return), !;
    Return = Default.

even(X) :- 0 is X mod 2.
    
piece_count((Num, Num), (S, AccDoubleMap), (S, ResultDoubleMap)) :- 
    get_assoc_or_default(Num, AccDoubleMap, 0, Value),
    NewValue is Value + 1,        
    put_assoc(Num, AccDoubleMap, NewValue, ResultDoubleMap).
    
piece_count((NumA, NumB), (AccSingleMap, D), (ResultSingleMap, D)) :- 
    NumA =\= NumB,
    side_count(NumA, AccSingleMap, TempMap),
    side_count(NumB, TempMap, ResultSingleMap).

side_count(Num, AccMap, ResultMap) :-
    get_assoc_or_default(Num, AccMap, 0, Value),
    NewValue is Value + 1,
    put_assoc(Num, AccMap, NewValue, ResultMap).