num_max([],0).
num_max([H|T],Max):-num_max(T,Num),(H>=Num,Max is H,!;Max is Num).
