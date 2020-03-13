#lang sicp

(define (iterative-improve good-enough? improve-guess)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve-guess) (improve-guess guess)))))

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))

(define (sqrt x)
  (define (improve-guess guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  ((iterative-improve good-enough? improve-guess) 1.0))

(sqrt 25)

(define (fixed-point f)
  (define (improve-guess guess)
    (f guess))
  (define (good-enough? guess)
    (< (abs (- (f guess) guess)) 0.0001))
  
  ((iterative-improve good-enough? improve-guess) 1.0))

(fixed-point (lambda (y) (+ (sin y) (cos y)))) 


