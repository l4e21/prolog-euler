:- use_module("src/problem_1", [main/0 as p1_main]).
:- use_module("src/problem_2", [main/0 as p2_main]).
:- use_module("src/problem_3", [main/0 as p3_main]).
:- use_module("src/problem_4", [main/0 as p4_main]).
:- use_module("src/problem_5", [main/0 as p5_main]).
:- use_module("src/problem_6", [main/0 as p6_main]).
:- set_prolog_flag(verbose, silent).
:- initialization(main).

main :-
    p1_main, p2_main, p3_main, p4_main, p5_main, p6_main.
