#lang sicp
(define (reverse l)
  (define (reverse-help l a)
    (if (null? l)
        a
        (reverse-help (cdr l) (cons (car l) a))))
  (reverse-help l (list)))

(reverse (list 1 4 9 16 25))