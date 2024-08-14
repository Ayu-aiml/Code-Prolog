gcd_find(A,B,Result):-B=:=0,Result is A.
gcd_find(A,B,Result):-R is A mod B,gcd_find(B,R,Result),!.

gcd_list([],Result):- Result is 0.
gcd_list([A|[]],Result):-Result is A.
gcd_list([A,B|T],Result):-gcd_find(A,B,R),gcd_list([R|T],Result),!.
