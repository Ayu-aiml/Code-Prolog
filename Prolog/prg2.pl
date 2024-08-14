cubefind(N,R):-R is N*N*N.
cube1():-write("Enter the number : "),read(N),cubefind(N,R),write("cube of given number is : "),write(R).
loop():-cube1(),write("\nTo stop write stop : "),read(N),N\=stop,loop().
