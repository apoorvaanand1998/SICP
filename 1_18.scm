#lang sicp

(define (mulp a b)
  (define (double x)
    (* x 2))
  (define (halve x)
    (/ x 2))
  (define (mulp-i a b rest)
    (cond ((= b 0) rest)
          ((even? b) (mulp-i (double a) (halve b) rest))
          (else (mulp-i a (- b 1) (+ rest a)))))
  (mulp-i a b 0))

(mulp 8 23)
