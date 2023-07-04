:- module(problem_1, [range/3, remove/3, sum_list/2, main/0, fizzbuzz_sum/1]).
:- set_prolog_flag(verbose, silent).

% Find the sum of all the multiples of 3 or 5 below 1000.

:- table range/3.

range(X, X, [X]).
range(X, Y, [X|Xs]) :- X =< Y,
                       Z is X+1,
                       range(Z, Y, Xs).

divisor_filter(X) :- X mod 3 =:= 0.
divisor_filter(X) :- X mod 5 =:= 0.

remove(_, [], []).
remove(C1, [X|Xs], [X|Ys]) :- call(C1, X), remove(C1, Xs, Ys).
remove(C1, [X|Xs], Ys) :- not(call(C1, X)), remove(C1, Xs, Ys).

sum_list([], 0).
sum_list([X|Xs], N) :- sum_list(Xs, M), N is M + X.

fizzbuzz_sum(N) :- range(0, 1000, X), remove(divisor_filter, X, Y), sum_list(Y, N).

main :-
    format("Euler problem 1: Find the sum of all the multiples of 3 or 5 below 1000~n"),
    fizzbuzz_sum(N),
    format("Solution is ~q~n", N).
