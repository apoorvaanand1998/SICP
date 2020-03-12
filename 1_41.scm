#lang sicp

(define (double f-single)
  (lambda (x) (f-single (f-single x))))

(define (inc x) (+ x 1))

((double inc) 3)
(((double double) inc) 5)
(((double (double double)) inc) 5)