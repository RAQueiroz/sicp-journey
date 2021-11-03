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


;5.9  Figure out what values each of the following will return before you try them on the computer:

(se (word (bl (bl (first '(make a))))
          (bf (bf (last '(baseball mitt)))))
    (word (first 'with) (bl (bl (bl (bl 'rigidly))))
          (first 'held) (first (bf 'stitches))))

(se (word (bl (bl 'bring)) 'a (last 'clean))
    (word (bl (last '(baseball hat))) (last 'for) (bl (bl 'very))
	  (last (first '(sunny days)))))

;5.10  What kinds of argument can you give butfirst so that it returns a word? A sentence?
; a word

;5.11  What kinds of argument can you give last so that it returns a word? A sentence?
; both words and sentences

;5.12  Which of the functions first, last, butfirst, and butlast can return an empty word?
;For what arguments? What about returning an empty sentence?
;
; bf an bl returns a empty word when given a single character word and an empty sentence when given
; a sentence with only one word
;

;5.13  What does ' 'banana stand for?
; It's a word "literal"

;What is (first ' 'banana) and why?
; 'quote I've no idea since first arity is 1 and with other examples it throws an error
; but in this case it returned the 'quote special form

;5.14  Write a procedure third that selects the third letter of a word (or the third word of a sentence).

(define (third txt)
  (item 3 txt))

;5.15  Write a procedure first-two that takes a word as its argument, returning a two-letter word
;containing the first two letters of the argument.

(define (first-two wd)
  (word (first wd) (first (bf wd))))

(first-two 'ambulatory)
;AM

;5.16  Write a procedure two-first that takes two words as arguments, returning a two-letter word
;containing the first letters of the two arguments.

(define (two-first wd1 wd2)
  (word (first wd1) (first wd2)))

(two-first 'brian 'epstein)
;BE

;5.17  Write a procedure knight that takes a person's name as its argument and returns the name
;with "Sir" in front of it.

(define (knight name)
  (se 'Sir name))

(knight '(david wessel))
;(SIR DAVID WESSEL)

; 5.18  Try the following and explain the result:

;(define (ends word)
;  (word (first word) (last word)))

; the procedure word was subscribed by the argument word in this procedure
; the correct should be

(define (ends wd)
  (word (first wd) (last wd)))
(ends 'john)

;5.19  Write a procedure insert-and that takes a sentence of items and returns
;a new sentence with an "and" in the right place:

(define (insert-and sent)
  (se (bl sent) 'and (last sent)))

(insert-and '(john bill wayne fred joey))
;(JOHN BILL WAYNE FRED AND JOEY)

;5.20  Define a procedure to find somebody's middle names:

(define (middle-names sent)
  (bf (bl sent)))

(middle-names '(james paul mccartney))
;(PAUL)

(middle-names '(john ronald raoul tolkien))
;(RONALD RAOUL)

(middle-names '(bugs bunny))
;()

(middle-names '(peter blair denis bernard noone))
;(BLAIR DENIS BERNARD)

;5.21  Write a procedure query that turns a statement into a question
;by swapping the first two words and adding a question mark to the last word:

(define (query sent)
  (se (item 2 sent) (item 1 sent) (bf (bf sent)) '?))

(query '(you are experienced))
;(ARE YOU EXPERIENCED?)

(query '(i should have known better))
;(SHOULD I HAVE KNOWN BETTER?)