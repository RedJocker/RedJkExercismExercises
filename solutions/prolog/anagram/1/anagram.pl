anagram(Word, Canditates, Anagrams) :-
    string(Word),
    string_lower(Word, LowerWord),
    atom_chars(LowerWord, WordAtoms),
    msort(WordAtoms, SortedWordAtoms),
    anagram(LowerWord, SortedWordAtoms, Canditates, Anagrams).   
anagram(LowerWord, SortedWordAtoms, [Candidate | Candidates], Anagrams) :-
    is_list(SortedWordAtoms),
    string_lower(Candidate, LowerCandidate),
    atom_chars(LowerCandidate, CandidateAtoms),
    anagram(LowerWord, SortedWordAtoms, Candidates, RestAnagrams),
    ((LowerWord = LowerCandidate, Anagrams = RestAnagrams);
     (msort(CandidateAtoms, SortedWordAtoms), Anagrams = [Candidate | RestAnagrams]);
     (Anagrams = RestAnagrams)), !.  
anagram(_, _, [], []).

