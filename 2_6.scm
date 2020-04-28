#lang sicp

; this question was really really hard
; you have to use the substitution model carefully to understand this

(define (church-to-num church)
  (define (count c)
    ((church (lambda(x) (+ x 1))) c))
  (count 0))

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define seven (lambda (f) (lambda (x) (f (f (f (f (f (f (f x))))))))))

(church-to-num zero)
(church-to-num one)
(church-to-num seven)
(church-to-num (add one seven))
(church-to-num (add seven (add one seven)))