#lang sicp

(define (fixed-point f initial-guess count)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) 0.00001))
  (let ((guess (f initial-guess)))
    (display guess)
    (display " ")
    (display count)
    (newline)
    (if (close-enough? guess)
        (f guess)
        (fixed-point f guess (+ count 1)))))

(define (avg x y) (/ (+ x y) 2))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0 0)
(fixed-point (lambda (x) (avg x (/ (log 1000) (log x)))) 2.0 0)
; Using average damping we get the fixed point in 8 iterations vs 32 without