:- use_module(library(plunit)).
%% :- initialization(main).

:- begin_tests(euler).

:- use_module("src/problem_1", [fizzbuzz_sum/1]).

test(problem_1) :-
    fizzbuzz_sum(234168).

:- use_module("src/problem_2", [solution/2]).

test(problem_2) :-
    solution(4000000, N), N =:= 4613732.

:- use_module("src/problem_3", [lpc/2]).

test(problem_3) :-
    lpc(600851475143, LPC), LPC =:= 6857.

:- use_module("src/problem_4", [largest_palindrome_product/3]).

test(problem_4) :-
    largest_palindrome_product(_, _, P),
    P =:= 906609.

:- use_module("src/problem_5", [smallest_divisible/2]).

test(problem_5) :-
    smallest_divisible(20, X),
    X =:= 232792560.

:- use_module("src/problem_6", [ss_diff/2]).

test(problem_6) :-
    ss_diff(100, X),
    X =:= 25164150.

:- use_module("src/problem_7", [nth_prime/2]).

test(problem_7) :-
    nth_prime(10001, X),
    X =:= 104743.

:- end_tests(euler).

main :-
    run_tests.
