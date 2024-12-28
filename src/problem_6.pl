:- module(problem_6, [main/0, ss_diff/2]).

%% Find the difference between the sum of the squares of the first 100 natural numbers and the square of the sum.

sum_from_to(X1, X2, Sum) :-
    sum_from_to(X1, X2, Sum, 0).

sum_from_to(X2, X1, Sum, Sum) :- X2 > X1, !.
sum_from_to(X1, X2, Sum, Acc) :-
    Acc2 is Acc + X1,
    X11 is X1 + 1,
    sum_from_to(X11, X2, Sum, Acc2).
    
square_of_sum(N, X) :-
    sum_from_to(1, N, SumToN),
    X is SumToN * SumToN.

sum_squares(X1, X2, Sum) :-
    sum_squares(X1, X2, Sum, 0).

sum_squares(X2, X1, Sum, Sum) :- X2 > X1, !.
sum_squares(X1, X2, Sum, Acc) :-
    X1Squared is X1 * X1,
    Acc2 is Acc + X1Squared,
    X11 is X1 + 1,
    sum_squares(X11, X2, Sum, Acc2).

sum_of_squares(N, X) :-
    sum_squares(1, N, X).

ss_diff(N, X) :-
    sum_of_squares(N, X1),
    square_of_sum(N, X2),
    X is X2 - X1.

main :-
    format("Euler Problem 6: Find the difference between the sum of the squares of the first 100 natural numbers and the square of the sum.~n"),
    ss_diff(100, X),
    format("Answer is ~q~n", X).
