:- module(problem_5, [main/0, smallest_divisible/2]).
:- use_module(problem_3, [next_prime/2]).

%% What is the smallest number that is divisible with no remainder for all the numbers 1 to 20?

smallest_divisible(N, X) :-
    Lowest is N // 2 + 1,
    problem_1:range(Lowest, N, Xs),
    smallest_divisible(N, Xs, Xs, N, X).

smallest_divisible(X, [], _, _, X).

smallest_divisible(Candidate, [Y|Ys], Xs, N, X) :-
    Candidate mod Y =:= 0,
    smallest_divisible(Candidate, Ys, Xs, N, X).

smallest_divisible(Candidate, _, Xs, N, X) :-
    Candidate2 is Candidate + N,
    smallest_divisible(Candidate2, Xs, Xs, N, X).

main :-
    format("Euler Problem 5: What is the smallest number that is divisible with no remainder for all the numbers 1 to 20?~n"),
    smallest_divisible(20, X),
    format("Answer is ~q~n", X).
