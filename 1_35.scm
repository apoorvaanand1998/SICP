#lang sicp

; We know that the golden ratio is the root of the quation x^2 = x+1
; Dividing both sides by x, we get x = 1 + (1/x). Proved!

(define (fixed-point f initial-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) 0.00001))
  (let ((guess (f initial-guess)))
    (if (close-enough? guess)
        (f guess)
        (fixed-point f guess))))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0) ; it works! = (1+sqrt(5))/2