#lang sicp

(define (cont-frac n d k)
  (define (cf-helper mid-frac k)
    (if (= k 0)
        mid-frac
        (cf-helper (/ (n k) (+ (d k) mid-frac)) (- k 1))))
  (cf-helper 0 k))

(define (d i)
  (if (= (remainder (+ i 1) 3) 0)
      (- (+ i 1) (quotient (+ i 1) 3))
      1))

(define (value-e)
  (let ((rest (cont-frac (lambda (i) 1.0) d 100)))
    (+ 2 rest)))

(value-e)