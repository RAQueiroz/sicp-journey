#lang simply-scheme

;4.1
(define (ho-hum x y)
  (+ x (* 2 y)))
;(ho-hum 8 12) here x is substituted by 8 and y by 12

;4.2
(define (yawn x)
  (+ 3 (* x 2)))
;(yawn (/ 8 2))
;little people necessary:
;(Give their names, their specialties, their arguments, who hires them, and what they do with their answers.) 
;/:1 args=dividend and divisor, hired by=*, return its answer to *
;+:1 args=a list of addends, hired by=yawn, return its answer to yawn
;*:1 args=a list of factors, hired by=+, return its answer to +
;yawn:1 args=x, hired by=user, return its answer to user


;4.3 Here are some procedure definitions.
;For each one, describe the function in English,
;show a sample invocation, and show the result of that invocation.

(define (f x y) (- y x))
; subtraction function
; (f 5 3) => 2

(define (identity x) x)
; return the value given as parameter
; (identity 10) => 10
; (identity 'id) => 'id

(define (three x) 3)
; return 3
; (three 1000) => 3

(define (seven) 7)
; return 7
; (three 1000) => 7

(define (magic n)
  (- (/ (+ (+ (* 3 n)
              13)
           (- n 1))
        4)
     3))
; return the number given as parameter
; (magic 7) => 7

;4.4  Each of the following procedure definitions has an error of some kind.
;Say what's wrong and why, and fix it:

(define (sphere-volume r)
  (* (* (/ 4 3) 3.141592654)
     (* r r r)))
;the function was "returning two values"

(define (next x)
  (+ x  1))
;erro on the + function

(define (square x)
  (* x x))
;no argument was defined

(define (triangle-area base height)
  (* 0.5 base height))
;the necessary arguments weren't defined

(define (sum-of-squares x y)
  (+ (square x) (square y)))
;the arguments were wrong

;4.5  Write a procedure to convert a temperature from Fahrenheit to Celsius,
;and another to convert in the other direction.
;The two formulas are:
;C=5⁄9(F-32).
(define (f2c f)
  (* (/ 5 9) (- f 32)))

;F=9⁄5C+32
(define (c2f c)
  (+ 32 (* c (/ 9 6))))
  
;4.6  Define a procedure fourth that computes the fourth power of its argument.
;Do this two ways:
;first using the multiplication function
(define (fourth n)
  (* n n n n))

;and then using square and not (directly) using multiplication.
(define (fourth2 n)
  (square (square n)))

;4.7  Write a procedure that computes the absolute value of its argument by
;finding the square root of the square of the argument.
(define (myAbs n)
  (sqrt (square n)))

;4.8  "Scientific notation" is a way to represent very small or very large
;numbers by combining a medium-sized number with a power of 10.
;For example, 5×107 represents the number 50000000,
;while 3.26×10-9 represents 0.00000000326 in scientific notation.
;Write a procedure scientific that takes two arguments, a number and an exponent of 10,
;and returns the corresponding value:
(define (scientific coefficient exponent)
  (* coefficient (expt 10 exponent)))

;4.9 Define a procedure discount that takes two arguments:
;an item's initial price and a percentage discount. It should return the new price:

(define (discount price discount)
  (* price (- 1 (/ discount 100))))

;4.10 Write a procedure to compute the tip you should leave at a restaurant.
;It should take the total bill as its argument and return the amount of the tip.
;It should tip by 15%, but it should know to round up so that the total amount of
;money you leave (tip plus original bill) is a whole number of dollars. (Use the ceiling procedure to round up.)

(define (tip bill)
  (- (ceiling (* bill 1.15)) bill))

