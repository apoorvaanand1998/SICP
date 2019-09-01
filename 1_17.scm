#lang sicp

(define (fast-mul a b)
  (define (double x)
    (* x 2))
  (define (halve x)
    (/ x 2))
  (cond ((= b 0) 0)
        ((even? b) (fast-mul (double a) (halve b)))
        (else (+ a (fast-mul a (- b 1))))))

(fast-mul 7 5)
(fast-mul 8 23)
