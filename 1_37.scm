#lang sicp

(define (cont-frac n d k)
  (define (cf-helper mid-frac k)
    (if (= k 0)
        mid-frac
        (cf-helper (/ (n k) (+ (d k) mid-frac)) (- k 1))))
  (cf-helper 0 k))

(define (cont-frac-rec n d k)
  (define (cf-helper counter)
    (if (= k counter)
        (/ (n k) (d k))
        (/ (n counter) (+ (d counter) (cf-helper (+ counter 1))))))
  (cf-helper 1))

(display "Iterative ")
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
(display "Recursive ")
(cont-frac-rec (lambda (i) 1.0) (lambda (i) 1.0) 10)

(define (which-value-k true-value)
  (define (found k)
    (display "The k for which approximate value is accurate to 4 decimal places is ")
    (display k))
  (define (try-k k)
    (let ((got-value (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))
      
      (if (and (< (- got-value true-value) 0.0001)
                (> (- got-value true-value) 0.00001))
          (found k)
          (try-k (+ k 1)))))
  (try-k 1))

(which-value-k 0.6180)