num_find([],_):-write("Element is not present in List").
num_find([H|T],Find):-H=:=Find,write("Found it successfully");num_find(T,find).
list_find(List):-write("Enter element that you want to search for  : "),read(N),num_find(List,N).
