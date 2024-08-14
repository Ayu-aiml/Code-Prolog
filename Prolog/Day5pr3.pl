vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).
vowel_count([],0).
vowel_count([H|T],Count):-vowel_count(T,Count1),(vowel(H),Count is 1+Count1,!;Count is Count1).
