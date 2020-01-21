#lang sicp

(define (cont-frac n d k)
  (define (cf-helper mid-frac k)
    (if (= k 0)
        mid-frac
        (cf-helper (/ (n k) (+ (d k) mid-frac)) (- k 1))))
  (cf-helper 0 k))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (- (* x x))))
             (lambda (i) (- (* 2 i) 1))
             k))

(tan-cf 3.14 100)