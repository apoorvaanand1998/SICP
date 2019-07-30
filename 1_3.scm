#lang sicp
(define (square x) (* x x))

(define (sumsq x y) (+ (square x) (square y)))

(define (2lsumsq x y z)
  (cond
    ((and (>= x z) (>= y z)) (sumsq x y))
    ((and (>= x y) (>= z y)) (sumsq x z))
    ((and (>= y x) (>= z x)) (sumsq y z))))

(square 5)

(sumsq 3 4)

(2lsumsq 2 3 4)
(2lsumsq 3 4 2)