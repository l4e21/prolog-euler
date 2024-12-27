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

:- table(lpp/6).

lpp(X, Y, L, H, P) :-
    lpp(X, Y, L, H, P, 0), !.

lpp(L, L, L, _, P, P) :- !.

lpp(L, Y, L, H, P, Acc) :-
    Y1 is Y - 1,
    lpp(H, Y1, L, H, P, Acc), !.

lpp(X, Y, L, H, P, Acc) :-
    P1 is X * Y,
    X1 is X - 1,
    (palindromic_number(P1) ->
         Acc1 is max(P1, Acc),
         lpp(X1, Y, L, H, P, Acc1);
     lpp(X1, Y, L, H, P, Acc)).

main :-
    format("Euler problem 4: Find the largest palindromic product of two three-digit numbers|n"),
    largest_palindrome_product(_, _, P),
    format("Solution is ~q~n", P).
