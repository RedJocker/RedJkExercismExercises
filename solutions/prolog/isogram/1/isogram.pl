isogram([]) :- true.

isogram([H | T]) :- 
    (\+ is_alpha(H); \+ member(H, T)),
    isogram(T).

isogram(Str) :- 
    string(Str),
    string_lower(Str, LowerCase),
    atom_chars(LowerCase, Chars),
    isogram(Chars).