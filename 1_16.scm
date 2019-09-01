#lang sicp

(define (fast-expt b n)
  (define (fast-expt-i b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-i (* b b) (/ n 2) a))
          (else (fast-expt-i b (- n 1) (* a b)))))
  (fast-expt-i b n 1))

(fast-expt 2 0)
(fast-expt 2 6)
(fast-expt 2 5)
(fast-expt 4 23)