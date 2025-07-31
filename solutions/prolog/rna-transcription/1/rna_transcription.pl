transcribe('G', 'C').
transcribe('C', 'G').
transcribe('T', 'A').
transcribe('A', 'U').

rna_transcription(Rna, Dna) :-
    string_chars(Rna, RnaLst),
    maplist(transcribe, RnaLst, DnaLst),
    string_chars(Dna, DnaLst).