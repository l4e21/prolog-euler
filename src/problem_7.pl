:- module(problem_7, [main/0, nth_prime/2]).
:- use_module(problem_3, [next_prime/2]).

%% What is the 10001st prime number?
nth_prime(N, P) :-
    nth_prime(N, P, 1, 2).

nth_prime(N, P, N, P).
nth_prime(N, P, I, P1) :-
    next_prime(P1, Pnext),
    I1 is I + 1,
    nth_prime(N, P, I1, Pnext).

main :-
    format("Euler Problem 7: What is the 10001st prime number?~n"),
    nth_prime(10001, P),
    format("Solution is ~q~n", P).
