list_delete_k([],_,[]):-write("List is empty").
list_delete_k([_|T],1,T).
list_delete_k([H|T],P,[H|T1]):-P>1,P1 is P-1,list_delete_k(T,P1,T1),!.
