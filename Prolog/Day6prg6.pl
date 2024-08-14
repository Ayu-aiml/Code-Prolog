rev_num(A,B,R):-(A=:=0,R is B;N1 is A mod 10,N2 is A//10,N3 is B*10+N1,rev_num(N2,N3,R)).
palindrome_num(A):-rev_num(A,0,N1),(N1=:=A,write("Number is Palindrome"),!;write("Number is not Palindrome"),!).
