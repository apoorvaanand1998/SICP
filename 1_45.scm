#lang sicp

(define (average x y) (/ (+ x y) 2.0))

(define (square x) (* x x))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (double f)
  (lambda (x) (f (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (even? n) (= (remainder n 2) 0))
  (define (repeated-helper f composed n)
    (cond ((= n 0)
           composed)
          ((even? n)
           (repeated-helper (double f) composed (/ n 2)))
          (else
           (repeated-helper f (compose f composed) (- n 1)))))
  (repeated-helper f (lambda (x) x) n))

(define (fixed-point f guess)
  (let ((curr (f guess))
        (tolerance 0.00001))
    (if (< (abs (- guess curr)) tolerance)
        curr
        (fixed-point f curr))))

(define (eighth-root x)
  (define (seven x) (* x x x x x x x))
  (fixed-point ((repeated average-damp 3) (lambda (y) (/ x (seven y))))
               1.0))

(eighth-root 16777216) ;this and above for experimentation

;lets implement nth root now

(define (pow n exp)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (pow-help n exp remain)
    (cond ((= exp 0)
           remain)
          ((even? exp)
           (pow-help (square n) (/ exp 2) remain))
          (else
           (pow-help n (- exp 1) (* n remain)))))
  (pow-help n exp 1))

(define (nth-root x n)
  (define (log2 x) (/ (log x) (log 2)))
  (let ((no-of-repeats (floor (log2 n))))
    (fixed-point ((repeated average-damp no-of-repeats) (lambda (y) (/ x (pow y (- n 1)))))
                 1.0)))

(nth-root 96889010407 13) ; should return 7
(nth-root 3486784401 20) ; should return 3
           

