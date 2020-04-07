#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< (* n d) 0)
        (cons (/ n g) (abs (/ d g)))
        (cons (/ n g) (/ d g)))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display " / ")
  (display (denom x)))
  
(print-rat (make-rat 4 8))
(print-rat (make-rat -2 -4))
(print-rat (make-rat -6 9))
(print-rat (make-rat 6 -9))
(print-rat (make-rat 55 0)) ; should be handled (not in this exercise though)


