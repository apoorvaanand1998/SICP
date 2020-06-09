#lang sicp
(define (sq x) (* x x))

(define (square-list-1 items)
  (if (null? items)
      nil
      (cons (sq (car items))
            (square-list-1 (cdr items)))))

(define (square-list-2 items)
  (map sq items))

(square-list-1 (list 1 2 3 4 5))

(square-list-2 (list 1 2 3 4 5))