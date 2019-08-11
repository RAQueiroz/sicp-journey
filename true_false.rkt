#lang simply-scheme

;Real Exercises
;Note: Writing helper procedures may be useful in solving some of these problems.

;6.5  Write a procedure european-time to convert a time from American AM/PM notation into European 24-hour notation.
;Also write american-time, which does the opposite:

(define (european-time t)
  (+
   (first t)
   (if (equal? '(am) (bf t))
       (if
        (equal? 12 (first t))
        12
        0)
       (if (equal? 12 (first t))
           0
           12))))

(define (american-time t)
  (cond ((= t 0) '(12 am))
        ((= t 12) '(12 pm))
        ((< t 12) '(t am))
        ((> t 12) (se (- t 12) 'pm))))
        

(european-time '(8 am))
;8

(european-time '(4 pm))
;16

(american-time 21)
;(9 PM)

(american-time 12)
;(12 PM)

(european-time '(12 am))
;24
;Getting noon and midnight right is tricky.

;6.6  Write a predicate teen? that returns true if its argument is between 13 and 19.

(define (between? number floor ceil)
  (and (> number floor) (< number ceil))) 

(define (teen? age)
  (between? age 12 20)) 

(teen? 15)
(teen? 13)
(teen? 20)

;6.7  Write a procedure type-of that takes anything as its argument and returns one of the words word,
;sentence, number, or boolean:

(define (type-of value)
  (cond ((number? value) 'number)
        ((word? value) 'word)
        ((sentence? value) 'sentence)
        ((boolean? value) 'bollean)))

(type-of '(getting better))
;SENTENCE

(type-of 'revolution)
;WORD

(type-of (= 3 3))

(type-of 7)
;BOOLEAN
;(Even though numbers are words, your procedure should return number if its argument is a number.)
;Feel free to check for more specific types, such as "positive integer," if you are so inclined.

;6.8  Write a procedure indef-article that works like this:

(define (vowel? letter)
  (member? letter 'aeiou))

(define (indef-article wd)
  (se (if (vowel? (first wd))
          'an
          'a)
      wd))

(indef-article 'beatle)
;(A BEATLE)

(indef-article 'album)
;(AN ALBUM)
;Don't worry about silent initial consonants like the h in hour.

;6.9  Sometimes you must choose the singular or the plural of a word:
;1 book but 2 books. Write a procedure thismany that takes two arguments,
;a number and a singular noun, and combines them appropriately:

(define (thismany q wd)
  (se q
      (word wd (if
                (> q 1)
                's
                ""))))

(thismany 1 'partridge)
;(1 PARTRIDGE)

(thismany 3 'french-hen)
;(3 FRENCH-HENS)

;6.10  Write a procedure sort2 that takes as its argument a sentence containing two numbers.
;It should return a sentence containing the same two numbers, but in ascending order:

(define (sort2 numbers)
  (if (before? (first numbers) (first (bf numbers)))
      (se (first numbers)  (bf numbers))
      (se (bf numbers) (first numbers))))

(sort2 '(5 7))
;(5 7)

(sort2 '(7 5))
;(5 7)

;6.11  Write a predicate valid-date? that takes three numbers as arguments,
;representing a month, a day of the month, and a year. Your procedure should return
;#t if the numbers represent a valid date (e.g., it isn't the 31st of September).
;February has 29 days if the year is divisible by 4, except that if the year is divisible by 100
;it must also be divisible by 400.

(define (divisible? big small)
  (= (remainder big small) 0))

(define (feb-days year)
  (if (or(and (divisible? year 4)
       (not (divisible? year 100)))
       (divisible? year 400))
      29
      28))

(define (valid-date? m d y)
  (if (between? m 0 13)
      (if (between? d 0 32)
          (or (and (member? m '(1 3 5 7 8 10 12))
                       (between? d 0 32))
              (and (member? m '(4 6 9 11))
                       (between? d 0 31))
              (between? d 0 (+ 1 (feb-days y))))
         #f)#f))

(valid-date? 10 4 1949)
;#T

(valid-date? 20 4 1776)
;#F

(valid-date? 5 0 1992)
;#F

(valid-date? 2 29 1900)
;#F

(valid-date? 2 29 2000)
;#T

;6.12  Make plural handle correctly words that end in y but have a vowel before the y, such as boy.
;Then teach it about words that end in x (box). What other special cases can you find?

(define (pluralize wd)
  (cond
    ((equal? (word (last (bl wd)) (last wd)) 'us) (word (bl (bl wd)) 'i))
    ((equal? (word (last (bl wd)) (last wd)) 'is) (word (bl (bl wd)) 'es))
    ((equal? (word (last (bl wd)) (last wd)) 'on) (word (bl (bl wd)) 'a))
    ((member?
      (if (not (vowel? (last (bl wd))))
          (word (last (bl wd)) (last wd))
          (last wd))
          '(s ss sh ch x z tz))
         (word wd 'es))
    ((or (equal? (last wd) 'f)
         (equal? (word (last (bl wd)) (last wd)) 'fe))
       (cond ((member? wd '(roof belief chef chief)) (word wd 's))
             ((equal? (last wd) 'f) (word (bl wd) 'ves))
             (else (word (bl (bl wd)) 'ves))))
    ((equal? (last wd) 'y)
     (if (vowel? (last (bl wd)))
         (word wd 's)
         (word (bl wd) 'ies)))
    ((equal? (last wd) 'o)
     (if (member? wd '(photo piano halo))
         (word wd 's)
         (word wd 'es)))
    (else (word wd 's))))
  
(pluralize 'truss)
;trusses
(pluralize 'bus)
;buses
(pluralize 'marsh)
;marshes
(pluralize 'lunch)
;lunches
(pluralize 'tax)
;taxes
(pluralize 'blitz)
;blitzes
(pluralize 'wife)
;wives
(pluralize 'wolf)
;wolves
(pluralize 'roof)
;roofs
(pluralize 'puppy)
;puppies
(pluralize 'ray)
;rays
(pluralize 'potato)
;potatoes
(pluralize 'photo)
;photos
(pluralize 'cactus)
;cacti
(pluralize 'analysis)
;analyses
(pluralize 'phenomenon)
;phenomena

;6.13  Write a better greet procedure that understands as many different kinds of names as you can think of:

;(greet '(john lennon))
;(HELLO JOHN)

;(greet '(dr marie curie))
;(HELLO DR CURIE)

;(greet '(dr martin luther king jr))
;(HELLO DR KING)

;(greet '(queen elizabeth))
;(HELLO YOUR MAJESTY)

;(greet '(david livingstone))
;(DR LIVINGSTONE I PRESUME?)

;6.14  Write a procedure describe-time that takes a number of seconds as its argument and returns a more useful description of that amount of time:

;(describe-time 45)
;(45 SECONDS)

;(describe-time 930)
;(15.5 MINUTES)

;(describe-time 30000000000)
;(9.506426344208686 CENTURIES)
