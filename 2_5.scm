#lang sicp

(define (sq x) (* x x))

(define (exp x y)
  (define (exp-help-iter x y rest)
    (cond ((= y 0)
           rest)
          ((= (remainder y 2) 0)
           (exp-help-iter (sq x) (/ y 2) rest))
          (else
           (exp-help-iter x (- y 1) (* x rest)))))
  (exp-help-iter x y 1))

(define (con x y)
  (* (exp 2 x) (exp 3 y)))

(define (car z)
  (define (car-help z-div n)
    (if (= (remainder z-div 2) 0)
        (car-help (/ z-div 2) (+ n 1))
        n))
  (car-help z 0))

(define (cdr z)
  (define (cdr-help z-div n)
    (if (= (remainder z-div 3) 0)
        (cdr-help (/ z-div 3) (+ n 1))
        n))
  (cdr-help z 0))

(car 648)
(cdr 648)

(car (con 3 4))
(cdr (con 3 4))