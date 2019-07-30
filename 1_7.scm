#lang sicp

(define (sqrt-iter guess n)
  (if (good-enough? guess n)
      guess
      (sqrt-iter (improve guess n) n)))

(define (improve guess n) (average guess (/ n guess)))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess n)
  (< (abs (- (* guess guess) n)) 0.001))

(define (new-ge? guess n)
  (<= (abs (- (improve guess n) guess)) (* 0.001 guess)))