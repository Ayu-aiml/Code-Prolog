list_sum_sq([],0).
list_sum_sq([H|T],Sum):-list_sum_sq(T,Sum1),Sum is (H*H)+Sum1.
