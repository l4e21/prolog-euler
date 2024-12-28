:- module(problem_3, [lpc/2, next_prime/2]).
:- use_module(problem_1, [range/3]).
:- use_module(problem_2, [odd/1]).

:- set_prolog_flag(verbose, silent).

% What is the largest prime factor of the number 600851475143 ?

is_prime(2).
is_prime(3).
is_prime(P) :-
    integer(P),
    P > 3,
    odd(P),
    \+ has_factor(P, 3).

has_factor(N, F) :-
    N mod F =:= 0.
has_factor(N, F) :-
    F * F < N,
    F2 is F + 2,
    has_factor(N, F2).

lpc(X, LPC) :-
    integer(X),
    X > 1,
    lpc(X, 2, LPC).

lpc(1, LPC, LPC) :- !.

lpc(X, LPC, R) :-
    is_prime(LPC),
    X mod LPC =:= 0,
    X1 is X // LPC,
    lpc(X1, LPC, R),
    !.

lpc(X, LPC, R) :-
    next_prime(LPC, LPC2),
    lpc(X, LPC2, R).
    
next_prime(F, NextF) :-
    F1 is F + 1,
    (is_prime(F1) -> NextF = F1 ; next_prime(F1, NextF)).

main :-
    format("Euler problem 3: What is the largest prime factor of the number 600851475143 ?~n"),
    lpc(600851475143, LPC),
    format("Solution is ~q~n", LPC).
