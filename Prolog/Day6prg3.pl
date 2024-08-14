gcd(A,B,Result):-B=:=0,Result is A.
gcd(A,B,Result):-R is A mod B,gcd(B,R,Result),!.
