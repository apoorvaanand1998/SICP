#lang sicp

(define (recprod term a next b)
  (if (> a b)
      1
      (recprod term (next a) next b)))

(define (iterprod term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (define (identity x) x)
  (define (inc1 x) (+ x 1))
  (iterprod identity 1 inc1 n))

(define (square x) (* x x))
(define (inc2 x) (+ x 2))

(define (pi-prod n)
  (define (term x)
    (/ (* (- x 2) x) (square (- x 1))))
  (iterprod term 4 inc2 n))

(factorial 6)
(* 4.0 (pi-prod 1000))
