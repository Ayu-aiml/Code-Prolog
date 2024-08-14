login(mandy,123).
login(sunny,456).
login(john,789).
login(asta,222).

user1(U,R):-login(U,R),write("\n logged successfully");write("\n invalid password"),write("\nenter password "),read(Y),user1(U,Y).
login1():-write("\nenter the usename "),read(X),write("\nenter password "),read(Y),login(X,_),user1(X,Y);write("\ninvalid username"),login1().

