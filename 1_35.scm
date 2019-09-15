#lang racket
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(/ (+ 1 2.236) 2) ; square root of 5 is 2.236
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)