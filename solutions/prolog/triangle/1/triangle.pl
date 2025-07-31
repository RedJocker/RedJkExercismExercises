validate_triagle_sides(S1, S2, S3) :- 
    S1 =< 0; 
    S2 =< 0; 
    S3 =< 0; 
    S1 + S2 < S3;
    S1 + S3 < S2;
    S2 + S3 < S1.

triangle(S1, S2, S3, _) :- validate_triagle_sides(S1, S2, S3), !, fail.
triangle(S, S, S, Type) :- Type = "equilateral".
triangle(S, S, _, Type) :- Type = "isosceles".
triangle(S, _, S, Type) :- Type = "isosceles".
triangle(_, S, S, Type) :- Type = "isosceles".
triangle(S1, S2, S3, Type) :- S1 =\= S2, S1 =\= S3, S2 =\= S3, Type = "scalene".