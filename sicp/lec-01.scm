#lang racket
(require berkeley)

; https://github.com/theurere/berkeley_cs61a_spring-2011_archive

;intro
6

(+ 6 8)

; when the operator comes first we can do
(+ 6 8 2 99 4000)

; for + and * we receive id when no vals are provided
(+)
(*)
; this errors (/)
; this are functions
+
sin

; string
'+
'hello

;fn compositions
(+ (* 3 7) (* 10 10))

; fn composition is such a powerful mechanism for
; organization computations that is basically all we need

; we now know 90% of the scheme language

; scheme first evaluates the expressions and then the function
; fn__exp__ ___exp__
;(+ (* 3 7) (* 10 10))

; not all function are fns with numbers
(first 'hello)

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

(define size 2)

(define (square x) (* x x))

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (absIf x)
  (if (< x 0)
      (- x)
      x))

; is the number between values
(define (isBetween5And10 x)
  (and (> x 5) (< x 10)))

(define (>= x y) 
  (not (< x y)))

