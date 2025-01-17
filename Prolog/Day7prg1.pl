fact1('apple').
append1(0, []).
append1(L, [* | BL]) :- L > 0, L1 is L - 1, append1(L1, BL), !.
blanklist(List1, BL1) :- length(List1, L), append1(L, BL1).
subs(_, X, X).
substitute(_, [], [], []).
substitute(N, [X | L1], [Y | BL1], [Y | Ans]) :- X \= N, substitute(N, L1, BL1, Ans).
substitute(N, [N | L1], [_ | BL1], [N | Ans]) :- substitute(N, L1, BL1, Ans).
guess(N, L1, BL1) :- member(N, L1), !, write('Correct!'), substitute(N, L1, BL1, Ans), name(X, Ans), fact1(X).
guess(_, _, _) :- write('You lost 1 chance').
hangman :- playHangman(7).
playHangman(0) :- write('You have run out of chances. The word was: '), fact1(Word), write(Word), nl.
playHangman(Z) :-Z > 0,
    write('The name is '),
    fact1(A),
    name(A, List1),
    blanklist(List1, Blanklist1),
    write(Blanklist1),
    write('\nGuess the character :
% Main game loop
 '),
    read(N),
    guess(N, List1, Blanklist1),
    (   member(N, List1)->  write('correct\n'),
        substitute(N, List1, Blanklist1, UpdatedBlanklist),
        (UpdatedBlanklist = List1->write('Congratulations! You guessed the word:'),fact1(X),write(X),nl;hangman);
         Z1 is Z - 1,hangman(Z1)
    ).

