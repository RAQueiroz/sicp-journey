#lang simply-scheme

;Boring Exercises

;3.1
(* 5 (+ 3 4))
(+ 3 (* 4 5))

;3.2
(+ 3 (* 4 5) (- 10 4)) ; 3 little people / 4 subexpressions
(+ (* (- (/ 8 2) 1) 5) 2) ; 4 little people / 3 subexpressions
(* (+ (- 3 (/ 4 2))
      (sin (* 3 2))
      (- 8 (sqrt 5)))
   (- (/ 2 3)
      4)) ; 10 little people / 3 subexpressions

;3.3 on the comments above

;3.4
(+ (* 3 (- 4 7))
   (- 8 (- 3 5)))
; Adam the plus specialist receives data from Bob and Claire
; Bob the product specialist receives the atomic expression 3 and the result from Dana
; Claire the minus specialist receives the atomic expression 8 and the result from Eleonore
; Dana the minus specialist receives two atomic expressions 4 and 7 and hand in her result to Bob
; Elonore the minus specialist receives two atomic expressions 3 and 5 and hand in her result to Claire

;3.5
(sqrt (+ 6 (* 5 2)))
;(sqrt (+ 6 10))
;(sqrt 16)
;4
(+ (+ (+ 1 2) 3) 4)
;(+ (+ 3 3) 4)
;(+ 6 4)
;10

;3.6
(+ 3 4 5 6 7)
;      3   4  5  6  7
;     _\/_\/_\/_\/_\/_
;    |                |
;    |                |
;    |                |
;    |                |
;    |______   _______|
;           \ /
;           25

(+ (+ 3 4) (+ 5 6 7))
;   3    4      5   6   7
;  _\/___\/_   _\/__\/__\/_
; |         | |            |
; |         | |            |
; |___    __| |___    _____|
;     \7 /        \18  /       
;     _\/__________\/_
;    |                |
;    |                |
;    |                |
;    |                |
;    |______   _______|
;           \ /
;           25

(+ (+ 3 (+ 4 5) 6) 7)
;
;                    4    5
;                   _\/___\/__
;                  |          |
;                  |    +     |
;                  |___    ___|
;                      \9 /
;               3   6   ||
;              _\/__\/__\/_
;             |            |
;             |    +       |
;             |___    _____|
;     \7 /        \18/       
;     _\/__________\/_
;    |                |
;    |      +         |
;    |______   _______|
;           \ /

;3.7
(/ 1 3) ; returns a fraction

;3.8 +, * , ...

;3.9

10 ; atom

(+ 3 2 5) ; compound expression made of three atoms

(+ 1 2 2 5) ; compound expression made of three atoms

(+ 1 (* 2 3) (/ 6 2))

(* 1 2 3 4 5 6)
;           25