#lang sicp

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-helper f composed n)
    (if (= n 1)
        composed
        (repeated-helper f (compose f composed) (- n 1))))
  (repeated-helper f f n))

((repeated square 2) 5)
((repeated inc 8) 3)

; since above is linear iterative
(define (double f-single)
  (lambda (x) (f-single (f-single x))))
; this above is taken from one of the previous exercises
(define (repeated-log f n)
  (define (even? x) (= (remainder x 2) 0))
  (define (repeated-log-help f composed n)
    (cond ((= n 0)
           composed)
          ((even? n)
           (repeated-log-help (double f) composed (/ n 2)))
          (else
           (repeated-log-help f (compose f composed) (- n 1)))))
  (repeated-log-help f (lambda (x) x) n))

((repeated-log square 2) 5)
((repeated-log inc 8) 3)
((repeated-log inc 169) 11)
          