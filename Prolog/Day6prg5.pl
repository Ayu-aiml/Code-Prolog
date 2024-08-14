rev([],L1,L1).
rev([H|T],L1,L2):-rev(T,[H|L1],L2).
comp([],[]):-write("List is Palindrome").
comp([H|L1],[H|L2]):-comp(L1,L2).
comp([_|_],[_|_]):-write("List is not Palindrome").
palindrome_list(L1):-rev(L1,[],L2),comp(L1,L2),!.
