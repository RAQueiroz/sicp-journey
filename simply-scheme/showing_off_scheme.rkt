#lang simply-scheme

(define (acronym phrase)
  (accumulate word (every first phrase)))

(define (acronym_real phrase)
  (accumulate word (every first (keep real-world? phrase))))

(define (real-world? wd)
  (not (member? wd '(a the an in of and for to with))))


(define (pigl wd)
  (if (member? (first wd) 'aeiou)
      (word wd 'ay)
      (pigl (word (butfirst wd) (first wd)))))


(define (choices menu)
  (if (null? menu)
      '(())
      (let ((smaller (choices (cdr menu))))
        (reduce append
                 (map (lambda (item) (prepend-every item smaller))
                      (car menu))))))

(define (prepend-every item list)
  (map (lambda (choice) (se item choice)) list))


(define (combinations size set)
  (cond ((= size 0) '(()))
        ((empty? set) '())
        (else (append (prepend-every (first set)
                                     (combinations (- size 1)
                                                   (butfirst set)))
                      (combinations size (butfirst set))))))


(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

