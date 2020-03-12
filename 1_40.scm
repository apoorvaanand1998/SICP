#lang sicp

(define (fixed-point f guess)
  (let ((curr (f guess))
        (tolerance 0.00001))
    (if (< (abs (- guess curr)) tolerance)
        (f guess)
        (fixed-point f curr))))

(define (deriv g)
  (let ((dx 0.00001))
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))))

(define (newtons-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newtons-transform g) guess))

(define (cubic a b c)
  (define (cube x) (* x x x))
  (define (square x) (* x x))
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(newtons-method (cubic -2 -6 4) 1.0) ; should give us either -2 or 2 + root(2) or 2 - root(2)
; we get 2 - root(2)

(newtons-method (cubic 1 -16 -16) 1.0) ; should give us -1 or 4 or -4
; we get -1