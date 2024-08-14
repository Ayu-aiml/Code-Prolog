%To calculate the length of list
list_length([],0).
list_length([_|T],Length):-list_length(T,Length1),Length is Length1+1.

%To calculate the sum of element of list
list_sum([],0).
list_sum([H|T],Sum):-list_sum(T,Sum1),Sum is H+Sum1.

%To calculate the average of element of list
list_avg([],0).
list_avg(Num,Avg):-list_sum(Num,Sum),list_length(Num,Length),Length>0,Avg is Sum/Length.
