:- module(problem_2, [main/0, solution/2, odd/1]).
:- use_module(problem_1, [remove/3, sum_list/2]).
:- set_prolog_flag(verbose, silent).

% By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

:- table fibonacci/2.

fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, X) :- N > 1, N1 is N-1, N2 is N-2, fibonacci(N1, Y), fibonacci(N2, Z), X is Z + Y.

gen_fibs_between(N, [], I) :- fibonacci(I, X), X > N.
gen_fibs_between(N, [X|Xs], I) :- fibonacci(I, X), I1 is I + 1, gen_fibs_between(N, Xs, I1).

odd(X) :- X mod 2 =:= 1.

solution(N, S) :- gen_fibs_between(N, Xs, 0), remove(problem_2:odd, Xs, Ys), sum_list(Ys, S), !.

main :-
    format("Euler problem 2: By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms. ~n"),
    solution(4000000, N), 
    format("Solution is ~q~n", N).
