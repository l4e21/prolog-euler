:- module(problem_4, [main/0, largest_palindrome_product/3]).

%% Find the largest palindromic product of two three-digit numbers

palindromic_number(X) :-
    integer(X),
    string_chars(X, S),
    reverse(S, S1),
    S = S1.

palindrome_product(X, Y, P) :-
    P is X * Y,
    palindromic_number(P).

largest_palindrome_product(X, Y, P) :- largest_palindrome_product(X, Y, P, 9009).
    
largest_palindrome_product(X, Y, Acc, Acc) :- X < 100, Y < 100.

largest_palindrome_product(X, Y, P, Acc) :-
    X < 100,
    Y1 is Y-1,
    largest_palindrome_product(Y1, Y1, P, Acc).

largest_palindrome_product(X, Y, P, Acc) :-
    palindrome_product(X, Y, P1),
    Z is max(Acc, P1),
    largest_palindrome_product(X-1, Y, P, Z).
    
largest_palindrome_product(X, Y, P, Acc) :-
    largest_palindrome_product(X-1, Y, P, Acc).
    
main :-
    format("Euler problem 4: Find the largest palindromic product of two three-digit numbers|n"),
    largest_palindrome_product(999, 999, P),
    format("Solution is ~q~n", P).
