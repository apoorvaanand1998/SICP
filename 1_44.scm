#lang sicp

(define (average x y z) (/ (+ x y z) 3))

(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x) (average (f (+ x dx)) (f x) (f (- x dx))))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (double f)
  (lambda (x) (f (f x))))

(define (repeated f n)
  (define (even? x) (= (remainder x 2) 0))
  (define (repeated-helper f composed n)
    (cond ((= n 0)
           composed)
          ((even? n)
           (repeated-helper (double f) composed (/ n 2)))
          (else
           (repeated-helper f (compose f composed) (- n 1)))))
  (repeated-helper f (lambda (x) x) n))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))


