#lang simply-scheme

; (quote) === '
(quote text)
'text

; operations with words

;
;; selectors --> take words/sentences apart
;

(first 'quote)
(item 2 'quote)
(item 3 'quote)
(item 4 'quote)
(last 'quote)
(butfirst 'quote) 
(butlast 'quote)

; 'word '(this is a sentence)
(first 'word)
; !==
(first '(word))

; double quotes are also valid
"word is word"

;
;; contructors --> put words/sentences together
;

(word 'r 'a 'c 'k 'e 't)
(word 1 2 3 4)
(sentence 'now 'or 'never)
(sentence 'o '(loco meu))
(se 'o '(loco meu))

;5.1  What values are printed when you type these expressions to Scheme? (Figure it out in your head before you try it on the computer.)

(sentence 'I '(me mine))

(sentence '() '(is empty))

(word '23 '45)

(se '23 '45)

(bf 'a)

(bf '(aye))

(count (first '(maggie mae)))

(se "" '() "" '())

(count (se "" '() "" '()))

;5.2  For each of the following examples, write a procedure of two arguments that, when applied to the sample arguments, returns the sample result. Your procedures may not include any quoted data.

(define (f1 s1 s2)
  (se (butfirst s1) (butlast s2)))

(f1 '(a b c) '(d e f))
;(B C D E)

(define (f2 s1 s2)
  (se (f1 s1 s2) (word (first s1) (last s2))))

(f2 '(a b c) '(d e f))
;(B C D E AF)

(define (f3 s1 s2)
  (se s1 s1))
(f3 '(a b c) '(d e f))
;(A B C A B C)

(define (f4 s1 s2)
  (word (item 2 s1) (item 2 s2)))
(f4 '(a b c) '(d e f))
;BE

;5.3  Explain the difference in meaning between (first 'mezzanine) and (first '(mezzanine)).

; The first call to first receives a word as a parameter and the second receives a sentence.
; The "first" procedure has different behaviours for words and sentences while it returns a
; word with only one character in the first example it returns a sentence with only one word in the second.

;5.4  Explain the difference between the two expressions (first (square 7)) and (first '(square 7)).

; In the first example the square funtion is invoked with 7 as a parameter while in the second example
; square and 7 are words of a sentence.

;5.5  Explain the difference between (word 'a 'b 'c) and (se 'a 'b 'c).

; The word procedure returns a single word that concatenates the individual words it receives
; and the se procedure returns a sentence composed by the single words it receives.

;5.6  Explain the difference between (bf 'zabadak) and (butfirst 'zabadak).

; Bf is a short form of butfisrt.

;5.7  Explain the difference between (bf 'x) and (butfirst '(x)).

; The first example returns a empty string while the other returns a empty sentence

;5.8  Which of the following are legal Scheme sentences?

;legal 
'(here, there and everywhere)
'(help!)
'(all i've got to do)
'(you know my name (look up the number))


