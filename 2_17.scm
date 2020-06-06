#lang sicp
(define (last-pair l)
  (if (null? (cdr l))
      l
      (last-pair (cdr l))))

(last-pair (list 24 12 14 93))