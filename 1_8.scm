#lang sicp

(define (cbrt-iter guess n)
  (if (good-enough? guess n)
      guess
      (cbrt-iter (improve guess n) n)))

(define (improve guess n)
  (/ (+ (/ n (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess n)
  (<= (abs (- (improve guess n) guess)) (* 0.001 guess)))

(cbrt-iter 1.0 (* 25 25 25))