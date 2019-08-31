#lang sicp

(define (fast-expt-i b n eo)
  (define (even? n)
    (= (remainder n 2) 0))
  (cond ((= n 0) 1)
        ((and (= n 1) (= eo 0)) b)
        ((and (= n 1) (not (= eo 0))) (* eo b))
        ((even? n) (fast-expt-i (* b b) (/ n 2) eo))
        (else (fast-expt-i (* b b) (/ (- n 1) 2) b))))

(fast-expt-i 5 5 0)