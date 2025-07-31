is_binary_char('0').
is_binary_char('1').
binary_num('0', Num) :- Num is 0.
binary_num('1', Num) :- Num is 1.


binary_lst(Str, Lst) :-
    atom_chars(Str, Lst),
    include(is_binary_char, Lst, Rst),
    Lst = Rst.

binary_lst_fold(Cur, Acc, Res) :- Res is ((2 * Acc) + Cur).

binary(Str, Dec) :- 
    binary_lst(Str, Lst),
    maplist(binary_num, Lst, Bin),
    foldl(binary_lst_fold, Bin, 0, Dec).