list_sum_pos([],0).
list_sum_pos([H|T],Sum):-list_sum_pos(T,Sum1),(H>0,Sum is H+Sum1,!;Sum is Sum1).
