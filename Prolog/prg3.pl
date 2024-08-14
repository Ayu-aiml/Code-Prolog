list_length([],0).
list_length([_|T],Length):-list_length(T,Length1),Length is Length1+1.
