list_insert_k([],X,_,[X]).
list_insert_k(L,X,1,[X|L]).
list_insert_k([Y|Z],X,P,[Y|Z1]):-P>1,P1 is P-1,list_insert_k(Z,X,P1,Z1),!.
