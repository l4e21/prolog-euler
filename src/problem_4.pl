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

largest_palindrome_product(X, Y, P) :-
    findall(Pal,
            (
            between(100, 999, X),
            between(100, 999, Y),
            palindrome_product(X, Y, Pal)
            ),
            Pals),
    max_list(Pals, P).
   
main :-
    format("Euler problem 4: Find the largest palindromic product of two three-digit numbers|n"),
    largest_palindrome_product(_, _, P),
    format("Solution is ~q~n", P).
