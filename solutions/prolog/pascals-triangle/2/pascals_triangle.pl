reverse_pascal(0, []):- !.
reverse_pascal(1, [[1]]):- !.
reverse_pascal(I, Rows) :-
    N is I - 1,
    reverse_pascal(N, [AboveRow | TopRows]),
    append([0] , AboveRow, PreZeroPadRow),
    append(AboveRow, [0], PostZeroPadRow),
    maplist(plus, PreZeroPadRow, PostZeroPadRow, CurrentRow),
    Rows = [CurrentRow, AboveRow | TopRows].

pascal(I, Rows) :-
    reverse_pascal(I, ReverseRows),
    reverse(ReverseRows, Rows).